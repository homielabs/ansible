# Innernet

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Networking magic

* [Original project](https://github.com/tonarino/innernet)
* [Additional docs](https://www.notion.so/yanghome/Innernet-59d6b804e229468abcbd4b1a40488068)

### Dependencies

* None (`innernet[-server]` will be installed by the role)

### Variables

| Variable                 | Description                                  | Default                                      | Type |
| ------------------------ | -------------------------------------------- | -------------------------------------------- | ---- |
| `innernet_version`       | innernet version to install                  | 1.2.0                                        | str  |
| `innernet_port`          | port innernet communicates over              | 51820                                        | int  |
| `innernet_server_base`   | name of base network/interface               | `magic-base`                                 | str  |
| `innernet_server_cidr`   | CIDR for `innernet_server_base`              | `10.42.0.0/16`                               | str  |
| `innernet_server_groups` | List of groups inside `innernet_server_base` | `[{ name: "humans", cidr: "10.42.1.0/24" }]` | list |

### Notes

None.
