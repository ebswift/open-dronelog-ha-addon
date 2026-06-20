FROM ghcr.io/arpanghosh8453/open-dronelog:latest

# Using :latest (currently points to stable v3.3.0)

RUN apt-get update && \
    apt-get install -y --no-install-recommends jq && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

ENTRYPOINT ["/app/run.sh"]
