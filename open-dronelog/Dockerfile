ARG CACHEBUST=1
FROM ghcr.io/arpanghosh8453/open-dronelog:3.3.0

# Pinned to 3.3.0 stable tag.
# To force a fresh image pull on Rebuild, increment CACHEBUST and commit.

RUN apt-get update && \
    apt-get install -y --no-install-recommends jq && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

ENTRYPOINT ["/app/run.sh"]
