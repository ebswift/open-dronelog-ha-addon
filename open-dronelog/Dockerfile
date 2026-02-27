ARG BUILD_FROM
FROM ${BUILD_FROM}

# The HA Supervisor injects options as /data/options.json at runtime.
# Our run.sh reads that file and translates it into env vars before
# starting the original entrypoint.

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]
