# Vault

## Secrets Management/Secrets as a Service

Another SaaS, I guess?

### Dependencies

None

### Variables

| Variable                         | Description                   | Default                              | Type   |
| -------------------------------- | ----------------------------- | ------------------------------------ | ------ |
| vault_location                   | storage root                  | "/data/vault"                        | `str`  |
| vault_data_location              | data location                 | "{{ vault_location }}/data"          | `str`  |
| vault_unseal_keys_location       | where to store unseal keys    | "{{ vault_location }}/unseal_keys"   | `str`  |
| vault_config_location            | config location               | "/etc/vault.d/vault.hcl"             | `str`  |
| vault_port                       | port to expose HTTP interface | 8200                                 | `int`  |
| disable_mlock                    | disable `mlock` syscall       | false                                | `bool` |
| vault_ssh_helper_install         | install SSH helper            | true                                 | `bool` |
| vault_ssh_helper_version         | SSH helper version            | "0.2.1"                              | `str`  |
| vault_ssh_helper_config_location | SSH helper config             | "/etc/vault-ssh-helper.d/config.hcl" | `str`  |

[`mlock` config](https://www.vaultproject.io/docs/configuration#disable_mlock)

### Notes

By default, prints out unseal keys + writes them at `{{ vault_unseal_keys_location }}`

Also does the same for the root key at `/{{ vault_location }}/root.key`.

`tasks/main.yml` will exit if it detects that Vault is already initialized.

This role skips the following suggested practices:

* creating a new `vault` user (we just abuse root, instead)
* storing unseal keys in different locations
* storing root key away from unseal keys/not storing root key
* storing unseal keys not on the same host as vault

However, there is some effort to reduce the attack surface:

* `/{{ vault_location }}/*` should have perms `0700` and owned by whoever ansible runs as
