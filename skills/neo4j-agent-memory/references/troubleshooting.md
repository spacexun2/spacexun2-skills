# Neo4j Memory Troubleshooting

Use only for an observed connection, driver, query, MCP, or fallback failure.

| Symptom | Action |
|---|---|
| MCP tools unavailable | Use an available compatible driver; do not assume project `.mcp.json` is active. |
| Certificate or routing failure on the current network | Use only a URI and certificate policy verified for that environment; keep instance-specific routing in machine-local configuration. |
| A direct protocol combination reports the routed database missing | Stop using that combination; return to the last target verified for the current environment. |
| Aura unavailable or near capacity | Report the boundary; switch to local Docker only after user confirmation. |
| Docker/container unavailable | Do not create or start it unless local fallback is authorized. |
| Large Cypher fails or returns no visible result | Split by node/relationship type and verify each batch with a read query. |
| PowerShell quoting or Chinese/path corruption | Put Cypher and parameters in UTF-8 Python/file input; do not infer graph corruption from terminal rendering. |
| Array/list property inspection fails | Pull candidate properties into Python and serialize safely instead of applying scalar Cypher conversion blindly. |

Do not install optional extractors, alter server configuration, or retry expensive/broad operations merely to diagnose a normal read or write request.
