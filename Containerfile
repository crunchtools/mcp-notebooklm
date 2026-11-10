# MCP NotebookLM CrunchTools Container
# Built on Hummingbird Python image for enterprise security
#
# Build:
#   podman build -t quay.io/crunchtools/mcp-notebooklm .
#
# Run (HTTP):
#   podman run -d -p 8025:8000 \
#     -v ~/.notebooklm-mcp-cli:/home/default/.notebooklm-mcp-cli:Z \
#     quay.io/crunchtools/mcp-notebooklm

FROM quay.io/hummingbird/python:3.14-builder AS build

USER root
RUN dnf install -y python3-pip && dnf clean all
# Install from a hash-pinned requirements.txt (uv pip compile of requirements.in),
# not a fresh resolve of the published package's floors (RT#1564). --no-deps so
# pip installs exactly the locked, hashed set.
COPY requirements.txt /tmp/requirements.txt
RUN python3 -m pip install --no-cache-dir --no-deps --prefix=/install -r /tmp/requirements.txt

FROM quay.io/hummingbird/python:3.14

LABEL name="mcp-notebooklm" \
      version="0.3.1" \
      summary="NotebookLM MCP server for Google NotebookLM integration" \
      description="Container wrapper for notebooklm-mcp-cli, providing MCP access to Google NotebookLM" \
      maintainer="crunchtools.com" \
      url="https://github.com/crunchtools/mcp-notebooklm" \
      io.k8s.display-name="MCP NotebookLM CrunchTools" \
      io.openshift.tags="mcp,notebooklm,google,ai" \
      org.opencontainers.image.source="https://github.com/crunchtools/mcp-notebooklm" \
      org.opencontainers.image.description="NotebookLM MCP server for Google NotebookLM integration" \
      org.opencontainers.image.licenses="AGPL-3.0-or-later"

COPY --from=build /install /usr

EXPOSE 8000
ENTRYPOINT ["notebooklm-mcp"]
CMD ["--transport", "http", "--host", "0.0.0.0", "--port", "8000"]
