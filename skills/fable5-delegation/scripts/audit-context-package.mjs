#!/usr/bin/env node

import { createHash } from 'node:crypto';
import { execFileSync } from 'node:child_process';
import { existsSync, lstatSync, mkdtempSync, readdirSync, readFileSync, rmSync } from 'node:fs';
import { extname, join, relative, resolve, sep } from 'node:path';
import { tmpdir } from 'node:os';

const targetArg = process.argv[2];
if (!targetArg) {
  console.error('Usage: node audit-context-package.mjs <directory-or-zip>');
  process.exit(1);
}

const target = resolve(targetArg);
if (!existsSync(target)) {
  console.error(`Target does not exist: ${target}`);
  process.exit(1);
}

const ignoredDirectories = new Set([
  '.git', 'node_modules', '.expo', 'dist', 'build', 'coverage', '.cache'
]);
const textExtensions = new Set([
  '.md', '.txt', '.json', '.jsonl', '.yaml', '.yml', '.toml', '.ini', '.env',
  '.js', '.mjs', '.cjs', '.ts', '.tsx', '.jsx', '.sql', '.py', '.sh', '.ps1'
]);
const maxTextFileBytes = 2 * 1024 * 1024;
const findings = [];
const files = [];

const secretPatterns = [
  ['private key', /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/g],
  ['database URL with password', /postgres(?:ql)?:\/\/[^\s:@]+:[^\s@]+@[^\s]+/gi],
  ['JWT-like token', /eyJ[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{10,}/g],
  ['cloud access key', /\b(?:(?:AKIA|ASIA)[A-Z0-9]{16}|AKLT[A-Za-z0-9]{16,})\b/g],
  ['Google API key', /\bAIza[0-9A-Za-z_-]{35}\b/g],
  ['GitHub token', /\b(?:gh[pousr]_[A-Za-z0-9]{36,255}|github_pat_[A-Za-z0-9_]{20,255})\b/g],
  ['provider key', /\b(?:sk|ark)-[A-Za-z0-9._-]{20,}\b/g],
  ['credential assignment', /\b(?:API_KEY|ACCESS_TOKEN|AUTH_TOKEN|SECRET(?:_KEY)?|PASSWORD)\s*=\s*["']?(?!\$\{|<|\[?REDACTED|process\.env|example)([^\s"']{12,})/g],
  ['bearer token literal', /Authorization\s*:\s*Bearer\s+(?!\$\{|<|REDACTED|example)[A-Za-z0-9._-]{16,}/gi]
];
const userPathPatterns = [
  ['possible Windows user home path', /\b[A-Za-z]:\\Users\\(?!<|\$\{|%|\[|(?:example|redacted|username)(?:\\|$))[^\\\s"'<>]+/gi],
  ['possible POSIX user home path', /\/(?:Users|home)\/(?!<|\$\{|%|\[|(?:example|redacted|username)(?:\/|$))[^\/\s"'<>]+/g]
];

function sha256(buffer) {
  return createHash('sha256').update(buffer).digest('hex');
}

function inspectText(name, buffer) {
  if (buffer.length > maxTextFileBytes) return;
  const text = buffer.toString('utf8');
  if (text.includes('\uFFFD')) findings.push({ severity: 'warn', file: name, issue: 'UTF-8 replacement character found' });
  for (const [label, pattern] of secretPatterns) {
    pattern.lastIndex = 0;
    if (pattern.test(text)) findings.push({ severity: 'block', file: name, issue: `possible ${label}` });
  }
  for (const [label, pattern] of userPathPatterns) {
    pattern.lastIndex = 0;
    if (pattern.test(text)) findings.push({ severity: 'warn', file: name, issue: label });
  }
}

function addFile(name, buffer) {
  const normalized = name.replaceAll('\\', '/');
  files.push({ name: normalized, bytes: buffer.length, sha256: sha256(buffer) });
  if (textExtensions.has(extname(normalized).toLowerCase()) || normalized.endsWith('.env')) {
    inspectText(normalized, buffer);
  }
  if (/(^|\/)(?:\.env(?:\.|$)|credentials?|secrets?)(\/|$)/i.test(normalized)) {
    findings.push({ severity: 'block', file: normalized, issue: 'secret-like filename or path' });
  }
}

function walkDirectory(root, current = root) {
  for (const entry of readdirSync(current, { withFileTypes: true })) {
    if (entry.isDirectory() && ignoredDirectories.has(entry.name)) continue;
    const fullPath = join(current, entry.name);
    if (entry.isDirectory()) walkDirectory(root, fullPath);
    else if (entry.isFile()) addFile(relative(root, fullPath).split(sep).join('/'), readFileSync(fullPath));
  }
}

function inspectZip(zipPath) {
  const extracted = mkdtempSync(join(tmpdir(), 'fable-context-audit-'));
  try {
    if (process.platform === 'win32') {
      const quotedZip = zipPath.replaceAll("'", "''");
      const quotedTarget = extracted.replaceAll("'", "''");
      execFileSync('powershell', [
        '-NoProfile', '-NonInteractive', '-Command',
        `Expand-Archive -LiteralPath '${quotedZip}' -DestinationPath '${quotedTarget}' -Force`
      ], { stdio: 'pipe', maxBuffer: 20 * 1024 * 1024 });
    } else {
      execFileSync('unzip', ['-qq', zipPath, '-d', extracted], { stdio: 'pipe', maxBuffer: 20 * 1024 * 1024 });
    }
    walkDirectory(extracted);
  } catch (error) {
    findings.push({ severity: 'block', file: zipPath, issue: `cannot inspect zip contents: ${error.message}` });
  } finally {
    rmSync(extracted, { recursive: true, force: true });
  }
}

const stat = lstatSync(target);
if (stat.isDirectory()) walkDirectory(target);
else if (extname(target).toLowerCase() === '.zip') inspectZip(target);
else addFile(target, readFileSync(target));

const names = new Set(files.map((file) => file.name.toLowerCase()));
if (![...names].some((name) => name === 'start_here.md' || name.endsWith('/start_here.md'))) {
  findings.push({ severity: 'warn', file: '.', issue: 'START_HERE.md not found' });
}

const knownBytes = files.reduce((sum, file) => sum + (file.bytes ?? 0), 0);
const largest = files.filter((file) => file.bytes !== null)
  .sort((a, b) => b.bytes - a.bytes).slice(0, 10);
const hashes = new Map();
for (const file of files) {
  if (!file.sha256) continue;
  const group = hashes.get(file.sha256) ?? [];
  group.push(file.name);
  hashes.set(file.sha256, group);
}
const duplicateGroups = [...hashes.entries()]
  .filter(([, namesForHash]) => namesForHash.length > 1)
  .map(([hash, namesForHash]) => ({ sha256: hash, files: namesForHash }))
  .sort((a, b) => b.files.length - a.files.length);
const result = {
  target,
  fileCount: files.length,
  scannedBytes: knownBytes,
  blockingFindings: findings.filter((item) => item.severity === 'block'),
  warnings: findings.filter((item) => item.severity === 'warn'),
  duplicateGroups,
  largestScannedFiles: largest
};

console.log(JSON.stringify(result, null, 2));
process.exit(result.blockingFindings.length > 0 ? 2 : 0);
