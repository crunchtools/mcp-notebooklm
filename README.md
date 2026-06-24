# mcp-notebooklm

Container wrapper for [notebooklm-mcp-cli](https://github.com/nicholasgasior/notebooklm-mcp-cli), providing MCP access to Google NotebookLM.

Built on [Hummingbird Python](https://quay.io/hummingbird/python) (Red Hat hardened image) with multi-stage build for minimal attack surface.

## Quick Start

```bash
# HTTP transport (for remote/shared access)
podman run -d -p 8025:8000 \
  -v ~/.notebooklm-mcp-cli:/home/default/.notebooklm-mcp-cli:Z \
  quay.io/crunchtools/mcp-notebooklm

# stdio transport (for local Claude Code)
podman run -i --rm \
  -v ~/.notebooklm-mcp-cli:/home/default/.notebooklm-mcp-cli:Z \
  quay.io/crunchtools/mcp-notebooklm \
  --transport stdio
```

## Authentication

NotebookLM requires browser-based Google authentication. Run `nlm login` locally to generate credentials, then mount the credential directory into the container.

## Upstream

<!-- mcp-name: io.github.crunchtools/mcp-notebooklm -->

Wraps [notebooklm-mcp-cli](https://pypi.org/project/notebooklm-mcp-cli/) v0.7.7.

## License

AGPL-3.0-or-later
