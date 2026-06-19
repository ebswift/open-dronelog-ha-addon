ARG BUILD_FROM
FROM ${BUILD_FROM}

# Robust HAOS wrapper. Copies run.sh and forces it as entrypoint
# so that SYNC_LOGS_PATH and other options are always processed.

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

# Use exec form and ensure we always run our wrapper
CMD ["/app/run.sh"]
