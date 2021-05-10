# LDAP/Gluu

## Gluu

[Gluu community edition](https://gluu.org/docs/gluu-server/4.0/installation-guide/install-docker/)

### Dependencies

* container role (podman only for now)
* Min 1 cores, ~1.5-2GiB RAM
  * Suggested 2+ cores though - with 2 cores noticed that setup would cause load to be >= 3 sometimes

### Variables

| Variable              | Description                                               | Default      | Type |
| --------------------- | --------------------------------------------------------- | ------------ | ---- |
| `gluu_admin_password` | password for maybe the `admin` user in the web interface? | `Password1!` | str  |
| `gluu_ldap_password`  | password for ldap/default admin user according to docs    | `Password1!` | str  |

There are requirements for the passwords, see `defaults/main.yml` for more.

### Notes

* Just uses community edition containers directly
  * Ignores setup scripts/based on setup scripts?
  * Ignores persisting data - probably just remove the "delete `/data`" step in `tasks/main.yml` to fix this?
* Vault `mlock` is disabled (you'll have to configure this manually if you care)
  * Had issues getting this to work in LXC containers
* Does a little hacking to get some configs into Consul because the persistence container misses some keys
* Does a little port remapping for oxAuth/oxTrust because [some old docs say to](https://github.com/GluuFederation/gluu-docker/wiki/Simple-Docker-Deployment)
  * nginx container was unable to find requisite ports without this - assuming port is hardcoded
* Not really production ready
* In consul, you can probably ignore the the 2x consul/vault entries - might just be a networking thing
* LDAP clustering disabled
* Still one missing issue on the oxTrust configuration attempting to get an SSL cert for something
  * not sure what cert it's trying to acquire, though

#### Exposed Ports/Services

* Exposes consul on 8500
* Exposes vault on 8200
  * Their setup scripts don't expose web UIs for consul or vault AFAIK
* Exposes nginx container on 80/443

#### Dependency Chain

* Consul
* Vault
* registrator / config-init (puts data into consul)
* OpenDJ
* persistence (puts data into LDAP)
* oxAuth (depends on data from persistence)
* oxTrust (depends on data from oxAuth + persistence)
* nginx (displays content from oxTrust)
