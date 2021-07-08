# Media Management

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## TV/Movie management

Provides sonarr service at `:8989`.
Provides deluge as torrent client at `:8112`.

### Dependencies

* role: container
* role: caddy (reverse proxy Web UI)

### Variables

| Variable         | Description      | Default              | Type |
| ---------------- | ---------------- | -------------------- | ---- |
| sonarr_container | docker container | `linuxserver/sonarr` | str  |
| vpn_user         | vpn username     | ``                   | str  |
| vpn_pass         | vpn password     | ``                   | str  |
| vpn_provider     | vpn provider     | ``                   | str  |

### Notes

Place your `ovpn` config file in `files/` named the same as `vpn_provider`. It will be copied to the host.
