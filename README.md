# Ansible

## Speedy Config Time

### Usage

1. spin up machine
2. add the ansible SSH key to the machine
3. add machine to hosts
4. `ansible-playbook site.yml`

### Roles

| role        | function                              |
|-------------|---------------------------------------|
| baseline    | basic config                          |
| bitwarden   | password manager                      |
| caddy       | reverse proxy                         |
| docker      | containerization (may install podman) |
| duo         | 2FA SSH                               |
| firewalld   | firewall configuration                |
| letsencrypt | certificates                          |
| nginx       | reverse proxy                         |

### Special Groups

| group      | meaning                                          |
|------------|--------------------------------------------------|
| bastion    | something public facing. Gets `fail2ban` installed |
| homeServer | gets `telegraf` installed and pointed to `influx`    |

### Suggested vars

| var                    | reason                            | required by   |
|------------------------|-----------------------------------|---------------|
| domain                 | url, duh                          | reverse proxy |
| dns_digitalocean_token | DNS validation for wildcard certs | letsencrypt   |
| email                  | for DNS validation                | letsencrypt   |
| duo                    | duo 2fa                           | duo           |
| fail2ban_destemaili    | where fail2ban emails go          | baseline      |
| influxdb_urls          | where to send metrics             | baseline      |
| telegraf               | metrics configuration             | baseline      |
