# influxdb

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Installs Telegraf/Influxdb as containers

### Dependencies

* `container` role

### Variables

| Variable            | Description                    | Default      | Type |
| ------------------- | ------------------------------ | ------------ | ---- |
| `influxdb_urls`     | list of urls influxdb lives at | `[]`         | list |
| `influx_components` | list of components to install  | `[telegraf]` | list |

### Notes

* Telegraf installed as container with `/:/hostfs:ro` to read host metrics
  * Design decision: ubuntu doesn't have groovy packages
