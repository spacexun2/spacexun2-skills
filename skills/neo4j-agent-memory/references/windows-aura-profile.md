# Windows AuraDB Profile Template

Use this optional template only when the task targets AuraDB from Windows. Resolve all values from environment variables or an external machine-local profile. Never place real credentials, instance IDs, or database identifiers in this repository.

## Environment Contract

```text
NEO4J_ROUTED_URI=neo4j+s://<instance-id>.databases.neo4j.io
NEO4J_DATABASE=<database-name>
NEO4J_USERNAME=<environment-variable value>
NEO4J_PASSWORD=<environment-variable value>
```

Use `driver.session(database=os.environ["NEO4J_DATABASE"])` and verify connectivity with a bounded read such as `RETURN 1` before task work.

Do not change URI schemes or certificate policy speculatively. If the current network requires a different verified route, keep that route in machine-local configuration and record only the general troubleshooting lesson in the public skill.

## Driver Path

Prefer an existing compatible Python runtime. If the `neo4j` package is absent, install it only into a temporary external directory rather than a repository or global Python environment.

Keep non-trivial Cypher in a UTF-8 file or Python string with parameters. Do not embed multilingual text, local paths, credentials, or multi-statement Cypher directly in a shell argument.

## MCP

MCP is optional. Use it when the active client exposes configured Neo4j tools. Otherwise use an available driver. A project-local MCP configuration file is not proof that tools are loaded in the current task.

## Local Fallback

Use a local database only when the user explicitly requests local/offline operation or confirms a fallback after a remote connection problem. Do not silently create, start, or switch databases. Read back results after writes.
