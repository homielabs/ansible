# Skeleton

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## New roles start here

Installs netmaker, netclient, and configures the netmaker web UI.

* netmaker dashboard at `dashboard.netmaker.{{ domain }}`
* netmaker api at `api.netmaker.{{ domain }}`

### Dependencies

* DNS entries for `{dashboard,api}.netmaker.{{ domain }}`
* caddy, container roles

### Variables

| Variable                | Description           | Default   | Type |
| ----------------------- | --------------------- | --------- | ---- |
| `netmaker_version`      | version to deploy     | `v0.14.2` | str  |
| `netmaker_ui_container` | container URL         |           | str  |
| `netmaker_environments` | environments to setup | `[]`      | list |

### Notes

* multiple environments untested
* systemd service for server is a template so you can maybe spawn multiple
  * untested
* netclient buggy - can't seem to connect
* you should configure `netmaker_environments[].config.allowedorigin` to have
  the value of the dashboard; this will allow the dashboard (only) to make
  changes.
* unclear what `netmaker_environments[].config.host` does at the moment.
* does not set up MQ server
