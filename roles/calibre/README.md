# Calibre

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Book reader/management system

* Ships with `linuxserver/calibre` and `linuxserver/calibre-web`

### Dependencies

* caddy role (reverse proxy for calibre-web)
* container role

### Variables

[//]: # (Add any role-specific variables here, in the table)

| Variable              | Description                            | Default                   | Type |
| --------------------- | -------------------------------------- | ------------------------- | ---- |
| calibre_container     | container image to use for calibre     | `linuxserver/calibre`     | str  |
| calibre_web_container | container image to use for calibre-web | `linuxserver/calibre-web` | str  |

### Notes

* `/data/books` is shared between images
  * and is also likely a network share to facilitate book addition
