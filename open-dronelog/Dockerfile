FROM ghcr.io/arpanghosh8453/open-dronelog:latest

# Explicit FROM (required on HAOS >= 2026.6 / Supervisor >= 2026.04)
# The old ARG BUILD_FROM + FROM ${BUILD_FROM} pattern no longer works.
# This wrapper ensures run.sh is always executed so that
# SYNC_LOGS_PATH, DJI_API_KEY, etc. from options.json are processed.

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]
