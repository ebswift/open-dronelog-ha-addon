# Open DroneLog

Open DroneLog is a local-first drone flight log viewer with interactive charts, 3D maps, and analytics.

## Features

- Import and view DJI and Litchi flight logs
- Interactive telemetry charts (altitude, speed, battery, attitude, RC, GPS, cell voltages)
- 3D flight path maps with terrain, replay, and color-by modes
- Overview analytics with heatmap, donut charts, and maintenance tracking
- Smart auto-tagging with offline reverse geocoding
- Full database backup and restore
- Metric and imperial unit support

## How it works

This add-on runs the Open DroneLog web application inside Home Assistant.
Your data is stored locally on your HA instance — nothing is sent to the cloud.

The web interface is accessible on port **8080** (configurable) or via the **Open web UI** button on the add-on page.

## Auto-sync

Drop your DJI log files into `/share/drone-logs/` (or any path under `/share` or `/media`) and configure `SYNC_LOGS_PATH` to auto-import them on startup.
