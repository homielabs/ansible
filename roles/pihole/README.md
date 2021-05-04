# pihole

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

## network level adblock + dns resolver

### Dependencies

* `pexpect` - unset web gui password
* `netaddr` - compute the netmask

### Variables

None.

### Notes

* If public facing, you should probably set a password.
* Configures some DNS servers already, but you can set your own if you prefer.
