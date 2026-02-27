# Open DroneLog — Home Assistant Add-on

[![Open DroneLog](https://img.shields.io/github/v/release/arpanghosh8453/open-dronelog?label=Open%20DroneLog)](https://github.com/arpanghosh8453/open-dronelog)

Local-first drone flight log viewer with charts, maps, and analytics — now as a Home Assistant add-on.

## Installation

1. In Home Assistant, go to **Settings → Add-ons → Add-on Store**.
2. Click the **⋮** menu (top-right) → **Repositories**.
3. Add this repository URL:
   ```
   https://github.com/arpanghosh8453/open-dronelog-ha-addon
   ```
4. Find **Open DroneLog** in the store and click **Install**.
5. (Optional) Configure your DJI API key and sync path in the **Configuration** tab.
6. Click **Start**.

## Configuration

| Option | Default | Description |
|---|---|---|
| `DJI_API_KEY` | *(empty)* | API key for decrypting DJI V13+ flight logs |
| `KEEP_UPLOADED_FILES` | `true` | Retain copies of imported log files |
| `SYNC_LOGS_PATH` | *(empty)* | Auto-import logs from this path (e.g., `/share/drone-logs`) |
| `SYNC_INTERVAL` | *(empty)* | Cron expression for scheduled sync (e.g., `0 0 */8 * * *`) |
| `LOG_LEVEL` | `info` | Log verbosity: `trace`, `debug`, `info`, `warn`, `error` |

### Auto-sync from shared folder

To automatically import DJI logs dropped into HA's shared folder:

1. Copy your `.txt` / `.dat` log files to the Home Assistant `/share/drone-logs/` folder.
2. Set `SYNC_LOGS_PATH` to `/share/drone-logs` in the add-on config.
3. Restart the add-on — files will be imported automatically.

## Supported formats

- DJI flight logs (`.txt`, `.dat`) including V13+ encrypted logs (requires API key)
- Litchi CSV exports
- Third-party apps (Dronelink, DroneDeploy) via DJIFly fallback

## More info

- [Open DroneLog on GitHub](https://github.com/arpanghosh8453/open-dronelog)
- [Support / Issues](https://github.com/arpanghosh8453/open-dronelog/issues)
