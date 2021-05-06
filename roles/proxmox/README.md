# Proxmox

For non-enterprise usage

* Removes login non-licensed nag
* Removes enterprise upstream and replaces with `pve-no-subscription`
* Removes the `NO_ATA_1X` flag for some externally-connected hard drives
  * Enables SMART reporting for those drives
