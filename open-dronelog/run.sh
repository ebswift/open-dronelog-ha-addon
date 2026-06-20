#!/usr/bin/env bash
set -e

# Always print banner first so we can see in logs whether the wrapper ran
printf '=============================================\n'
printf ' Open DroneLog — Home Assistant Add-on (ebswift fork)\n'
printf ' DATA_DIR:           /data/drone-logbook\n'

CONFIG_PATH="/data/options.json"

if [ -f "$CONFIG_PATH" ]; then
    DJI_API_KEY=$(jq -r '.DJI_API_KEY // empty' "$CONFIG_PATH")
    if [ -n "$DJI_API_KEY" ]; then
        mkdir -p /data/drone-logbook
        echo "{\"api_key\": \"$DJI_API_KEY\"}" > /data/drone-logbook/config.json
    fi

    KEEP_UPLOADED_FILES=$(jq -r '.KEEP_UPLOADED_FILES // "true"' "$CONFIG_PATH")
    export KEEP_UPLOADED_FILES

    SYNC_LOGS_PATH=$(jq -r '.SYNC_LOGS_PATH // empty' "$CONFIG_PATH")
    if [ -n "$SYNC_LOGS_PATH" ]; then
        export SYNC_LOGS_PATH
        # Create the path if it doesn't exist (harmless if already there)
        mkdir -p "$SYNC_LOGS_PATH" 2>/dev/null || true
    fi

    SYNC_INTERVAL=$(jq -r '.SYNC_INTERVAL // empty' "$CONFIG_PATH")
    if [ -n "$SYNC_INTERVAL" ]; then
        export SYNC_INTERVAL
    fi

    LOG_LEVEL=$(jq -r '.LOG_LEVEL // "info"' "$CONFIG_PATH")
    export RUST_LOG="$LOG_LEVEL"
else
    printf ' WARNING: /data/options.json not found - using defaults\n'
fi

printf ' SYNC_LOGS_PATH:     %s\n' "${SYNC_LOGS_PATH:-(not set)}"
printf ' SYNC_INTERVAL:      %s\n' "${SYNC_INTERVAL:-(not set)}"
printf ' RUST_LOG:           %s\n' "${RUST_LOG:-info}"

# Debug: show what files the container actually sees in the sync path
if [ -n "$SYNC_LOGS_PATH" ] && [ -d "$SYNC_LOGS_PATH" ]; then
    printf ' Files visible in sync path (first 10):\n'
    ls -1 "$SYNC_LOGS_PATH"/*.txt "$SYNC_LOGS_PATH"/*.dat 2>/dev/null | head -10 || printf '   (no matching .txt/.dat files or dir empty)\n'
else
    printf ' SYNC_LOGS_PATH dir does not exist or is not set\n'
fi

printf '=============================================\n'

# Hand off to the real app
exec /app/entrypoint.sh
