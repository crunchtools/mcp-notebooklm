# mcp-notebooklm Constitution

> **Version:** 1.1.0
> **Ratified:** 2026-06-24
> **Amended:** 2026-10-02
> **Status:** Active
> **Inherits:** [crunchtools/constitution](https://github.com/crunchtools/constitution) v1.20.0
> **Profile:** Container Image

This file holds what is specific to mcp-notebooklm. The fleet rules and the
Container Image profile apply at the inherited version and are checked against
this repo's files by `constitution.yml`. They are not restated here.

## Upstream Package

Container wrapper for the upstream
[`notebooklm-mcp-cli`](https://pypi.org/project/notebooklm-mcp-cli/) PyPI
package, providing MCP access to Google NotebookLM. The package is installed
at a pinned version (`notebooklm-mcp-cli==0.7.7`); this repo carries no
patches to it.

## Build Stages

| Stage | Image | Role |
|-------|-------|------|
| Build | `quay.io/hummingbird/python:latest-builder` | `pip install --no-cache-dir --prefix=/install` of the pinned package |
| Runtime | `quay.io/hummingbird/python:latest` | copies `/install` into `/usr`; runs as the Hummingbird default non-root UID 65532 |

## Instance

| Context | Name |
|---------|------|
| GitHub repo | `crunchtools/mcp-notebooklm` |
| Container image | `quay.io/crunchtools/mcp-notebooklm` |
| MCP registry name | `io.github.crunchtools/mcp-notebooklm` |
| Container port | 8000 (published on host port 8025 in the documented run) |

## Runtime and Credentials

- **Entrypoint:** `notebooklm-mcp`; default is HTTP transport on
  `0.0.0.0:8000`. `--transport stdio` serves local Claude Code.
- **Credentials:** NotebookLM needs browser-based Google authentication.
  `nlm login` is run locally and the resulting directory is mounted at
  `/home/default/.notebooklm-mcp-cli`. Nothing credential-bearing is baked
  into the image.
- **Smoke test:** `notebooklm-mcp --help` exits 0 in the built image.

## History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-09-19 | Constitution header converted; ratification date kept from the initial wrapper (2026-06-24) |
| 1.0.1 | 2026-09-25 | Gatehouse review, triage and pre-commit gates |
| 1.1.0 | 2026-10-02 | Manifest under constitution v1.18.0: fleet and profile restatement removed, wrapper specifics kept |
