# Bitwarden

## Selfhosted password management

### Dependencies

* container role
* caddy role

### Variables

| Variable    | Description                        | Default   |
| ----------- | ---------------------------------- | --------- |
| service     | dns prefix                         | passwords |
| bw_net_port | port to expose general api over    | 3011      |
| bw_wss_port | port to expose websockets api over | 3012      |

### Notes

* Uses the [vaultwarden](https://github.com/dani-garcia/vaultwarden) image
* Assumes caddy as the default reverse proxy
