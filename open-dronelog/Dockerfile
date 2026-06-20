FROM ghcr.io/arpanghosh8453/open-dronelog:nightly

# Using :nightly because :latest on GHCR has not been updated recently.
# nightly is newer (see GHCR package page).

RUN apt-get update && \
    apt-get install -y --no-install-recommends jq && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

ENTRYPOINT ["/app/run.sh"]
