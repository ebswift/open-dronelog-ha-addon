FROM ghcr.io/arpanghosh8453/open-dronelog:3.3.0

# Pinned to stable 3.3.0 upstream image.
# Bump version in config.yaml to force Supervisor to rebuild with fresh image.

RUN apt-get update && \
    apt-get install -y --no-install-recommends jq && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

ENTRYPOINT ["/app/run.sh"]
