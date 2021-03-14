# Factorio

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## Build and maintain factories

Deploy a multiplayer server. Uses [factoriotools/factorio](https://hub.docker.com/r/factoriotools/factorio/).

### Dependencies

* `container`

### Variables

| Variable                        | Description                  | Default                       | Type |
| ------------------------------- | ---------------------------- | ----------------------------- | ---- |
| factorio_version                | container version            | "stable"                      | str  |
| factorio_rcon_enabled           | enable rcon                  | `false`                       | bool |
| factorio_default_port           | default UDP port             | `['0.0.0.0:34197:34197/udp']` | list |
| factorio_rcon_port              | rcon port                    | "0.0.0.0:27105:27105/tcp"     | str  |
| factorio_settings_name          | server name                  | "server_name"                 | str  |
| factorio_settings_description   | server description           | ""                            | str  |
| factorio_settings_tags          | list of tags for server      | []                            | list |
| factorio_settings_username      | username of host             | ""                            | str  |
| factorio_settings_token         | token/password of host       | ""                            | str  |
| factorio_settings_game_password | server password              | ""                            | str  |
| factorio_settings_auto_pause    | pause when nobody is in game | `false`                       | bool |
| factorio_old_save               | use an old save. see notes.  | `true`                        | bool |

### Notes

* Exports ports directly on the host, because the client doesn't expect reverse proxies. Please ensure the following ports are available:
  * 34197/udp
  * 27015/tcp
* Upload an old save by placing `oldsave.zip` in `files/`
* If your server dies a lot, try swapping
* To update, you can stop/remove the container, optionally back up your saves, then redeploy this role
  * You may want to set `factorio_old_save` to `false` in this case, since you don't need to bootstrap a new server
