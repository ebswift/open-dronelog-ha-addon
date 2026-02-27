#!/usr/bin/env bash
set -e

# ---------------------------------------------------------------------------
# Read HA add-on options from /data/options.json and export as env vars.
# The Supervisor writes this file based on the user's config in the UI.
# ---------------------------------------------------------------------------

CONFIG_PATH="/data/options.json"

if [ -f "$CONFIG_PATH" ]; then
    # DJI API Key — write to config.json (same format the app expects)
    DJI_API_KEY=$(jq -r '.DJI_API_KEY // empty' "$CONFIG_PATH")
    if [ -n "$DJI_API_KEY" ]; then
        mkdir -p /data/drone-logbook
        echo "{\"api_key\": \"$DJI_API_KEY\"}" > /data/drone-logbook/config.json
    fi

    # Keep uploaded files
    KEEP_UPLOADED_FILES=$(jq -r '.KEEP_UPLOADED_FILES // "true"' "$CONFIG_PATH")
    export KEEP_UPLOADED_FILES

    # Sync logs path — map HA's /share or /media if the user configured it
    SYNC_LOGS_PATH=$(jq -r '.SYNC_LOGS_PATH // empty' "$CONFIG_PATH")
    if [ -n "$SYNC_LOGS_PATH" ]; then
        export SYNC_LOGS_PATH
    fi

    # Sync interval (cron expression)
    SYNC_INTERVAL=$(jq -r '.SYNC_INTERVAL // empty' "$CONFIG_PATH")
    if [ -n "$SYNC_INTERVAL" ]; then
        export SYNC_INTERVAL
    fi

    # Log level
    LOG_LEVEL=$(jq -r '.LOG_LEVEL // "info"' "$CONFIG_PATH")
    export RUST_LOG="$LOG_LEVEL"
fi

# Ensure data directory exists
export DATA_DIR="/data/drone-logbook"
mkdir -p "$DATA_DIR"

echo "============================================="
echo " Open DroneLog — Home Assistant Add-on"
echo " DATA_DIR:           $DATA_DIR"
echo " KEEP_UPLOADED_FILES: ${KEEP_UPLOADED_FILES:-true}"
echo " SYNC_LOGS_PATH:     ${SYNC_LOGS_PATH:-(not set)}"
echo " RUST_LOG:           ${RUST_LOG:-info}"
echo "============================================="

# Hand off to the original entrypoint from the Docker image
exec /app/entrypoint.sh
