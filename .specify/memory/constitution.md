---
version: 1.0.0
ratified: 2026-06-24
status: Active
inherits: crunchtools/constitution v1.0.0
profile: Container Image
---

# mcp-notebooklm Constitution

## License
AGPL-3.0-or-later

## Versioning
Semantic Versioning 2.0.0. Container image version tracks the upstream
`notebooklm-mcp-cli` PyPI package version where possible.

## Base Image
Multi-stage build:
- Build stage: `quay.io/hummingbird/python:latest-builder`
- Runtime stage: `quay.io/hummingbird/python:latest`

## Registry
- Primary: `quay.io/crunchtools/mcp-notebooklm`
- Mirror: `ghcr.io/crunchtools/mcp-notebooklm`

## Containerfile Conventions
- Multi-stage build to minimize runtime image size
- Required LABELs: name, version, summary, description, maintainer, url, OCI labels
- `--no-cache-dir` on pip install
- Non-root runtime (Hummingbird default UID 65532)

## Packages Installed
- `notebooklm-mcp-cli` (from PyPI, pinned version)

## Runtime
- ENTRYPOINT: `notebooklm-mcp`
- Default transport: HTTP on port 8000
- Credentials mounted via volume at `/home/default/.notebooklm-mcp-cli`

## Testing
- Container builds successfully
- `notebooklm-mcp --help` exits 0

## Quality Gates
- GHA container build passes on PR
- Trivy scan (informational)
