# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/) and this project adheres to
[Semantic Versioning](https://semver.org/).

## [Unreleased]


## [0.3.1] - 2026-11-10

### Fixed

- **Lock the wrapped CLI's transitive dependencies (RT#1564).** The image ran `pip install notebooklm-mcp-cli==0.7.7`, letting pip resolve all 74 transitive dependencies fresh at build time. Pin them in a hash-generated `requirements.txt` (`uv pip compile requirements.in`) and install with `--no-deps` so the image ships the exact set, not whatever PyPI held that day. Stays a container-only repo (no pyproject/uv.lock), so no profile change.

## [0.3.0] - 2026-10-20

### Changed

- Container base images pinned to `quay.io/hummingbird/python:3.14*` instead of
  `latest`, which moved to Python 3.15.0 on 2026-10-20 (crunchtools/constitution#66).

## [0.2.0] - 2026-10-11

### Changed

- Constitution is now a v1.18.0 manifest: it holds only what is specific to
  this repo; fleet and profile rules apply by reference.
- Constitution validation is pinned to the inherited release via
  `.github/workflows/constitution.yml`.
- Dependabot auto-merges GitHub Actions minor and patch updates.

## [0.1.0] - 2026-06-24

Initial tagged release. No GitHub Release was created for this tag, so no
authored release notes exist to back-fill from; this changelog starts here
(RT #1484).
