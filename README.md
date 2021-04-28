# Ansible

## Speedy Config Time

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

### Usage

1. spin up machine
2. add the ansible SSH key to the machine
3. add machine to inventory
4. setup environment with conda (recommended!)

```bash
conda env -f environment.yml
conda activate ansible-2.10
ansible-playbook site.yml
```

### Roles

| role        | function                              | deployed under |
| ----------- | ------------------------------------- | -------------- |
| baseline    | basic config                          |                |
| bitwarden   | password manager                      | passwords      |
| caddy       | reverse proxy                         |                |
| container   | containerization (may install podman) |                |
| duo         | 2FA SSH                               |                |
| firewalld   | firewall configuration                |                |
| innernet    | networking via wireguard              |                |
| letsencrypt | certificates                          |                |
| nginx       | reverse proxy                         |                |
| plex        | media server                          | plex           |
| proxmox     | configures proxmox after install      |                |
| step-ca     | ACME server                           | ca             |
| vault       | Hashicorp Vault                       | vault          |

#### Add a Role

Pass `n=<name>` to create a new role from the skeleton with name `<name>`.

```console
$ make new-role n=new-role
rm -rf roles/new-role
mkdir roles/new-role
cd roles/new-role && git init
Initialized empty Git repository in /mnt/d/Git/ansible/roles/new-role/.git/
cd roles && ansible-galaxy role init --offline --role-skeleton skeleton new-role --force
- Role new-role was created successfully
```

This Makefile will `exit 1` if you try to create a new role with the same name as one that already exists.

```console
(ansible-2.10) nickyang:ansible/ (master✗) $ make new-role n=new-role
role new-role already exists
make: *** [Makefile:34: new-role] Error 1
```

It will also pull [ansible_skeleton](https://github.com/guppy0130/ansible_skeleton) if you're missing the skeleton. You can change `$SKELETON` in the Makefile to switch which skeleton gets cloned.

### Lint

Lots of ways to manually lint (good for debug/verbose):

```bash
ansible-lint roles/*  # ignore the 901 errors if you run this
ansible-lint inventory/**/*.yml  # there's no inventory type for ansible-lint
ansible-lint site.yml  # you'll need to uncomment the roles
yamllint .
```

But you should really just install `pre-commit` and let that handle it for you.

### Special Groups

| group      | meaning                                            |
| ---------- | -------------------------------------------------- |
| bastion    | something public facing. Gets `fail2ban` installed |
| homeServer | gets `telegraf` installed and pointed to `influx`  |

### Suggested vars

| var                    | reason                            | required by      |
| ---------------------- | --------------------------------- | ---------------- |
| domain                 | url, duh                          | revprxy, step-ca |
| dns_digitalocean_token | DNS validation for wildcard certs | letsencrypt      |
| email                  | for DNS validation                | letsencrypt      |
| duo                    | duo 2fa                           | duo              |
| fail2ban_destemail     | where fail2ban emails go          | baseline         |
| influxdb_urls          | where to send metrics             | baseline         |
| telegraf               | metrics configuration             | baseline         |
