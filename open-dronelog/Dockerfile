FROM ghcr.io/arpanghosh8453/open-dronelog:latest

# Explicit FROM + ENTRYPOINT (required on HAOS 2026.6+ / Supervisor >= 2026.04)
# Install jq so run.sh can parse options.json

RUN apt-get update && \
    apt-get install -y --no-install-recommends jq && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

ENTRYPOINT ["/app/run.sh"]
