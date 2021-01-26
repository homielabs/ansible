# Ansible

## Speedy Config Time

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

### Usage

1. spin up machine
2. add the ansible SSH key to the machine
3. add machine to inventory
4. `ansible-playbook site.yml`

### Roles

| role        | function                              | deployed under |
|-------------|---------------------------------------|----------------|
| baseline    | basic config                          |                |
| bitwarden   | password manager                      | vault          |
| caddy       | reverse proxy                         |                |
| docker      | containerization (may install podman) |                |
| duo         | 2FA SSH                               |                |
| firewalld   | firewall configuration                |                |
| letsencrypt | certificates                          |                |
| nginx       | reverse proxy                         |                |
| plex        | media server                          | plex           |
| proxmox     | configures proxmox after install      |                |
| step-ca     | ACME server                           | ca             |

[Caddy inspo](https://github.com/aeolyus/homelab)

### Lint

Lots of ways to manually lint (good for debug/verbose):

```bash
ansible-lint roles/*  # most explicit/working
ansible-lint inventory/**/*.yml  # there's no inventory type for ansible-lint
ansible-lint site.yml  # you'll need to uncomment the roles
yamllint .
```

But you should really just install `pre-commit` and let that handle it for you.

### Special Groups

| group      | meaning                                          |
|------------|--------------------------------------------------|
| bastion    | something public facing. Gets `fail2ban` installed |
| homeServer | gets `telegraf` installed and pointed to `influx`    |

### Suggested vars

| var                    | reason                            | required by      |
|------------------------|-----------------------------------|------------------|
| domain                 | url, duh                          | revprxy, step-ca |
| dns_digitalocean_token | DNS validation for wildcard certs | letsencrypt      |
| email                  | for DNS validation                | letsencrypt      |
| duo                    | duo 2fa                           | duo              |
| fail2ban_destemail     | where fail2ban emails go          | baseline         |
| influxdb_urls          | where to send metrics             | baseline         |
| telegraf               | metrics configuration             | baseline         |
