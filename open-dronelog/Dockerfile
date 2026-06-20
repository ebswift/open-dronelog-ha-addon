FROM ghcr.io/arpanghosh8453/open-dronelog:latest

# Explicit FROM + ENTRYPOINT (required on HAOS 2026.6+ / Supervisor >= 2026.04)
# Removed image: from config.yaml so this Dockerfile is actually used.
# run.sh reads options.json and execs the real entrypoint.

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

ENTRYPOINT ["/app/run.sh"]
