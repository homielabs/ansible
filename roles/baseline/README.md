# Baseline

## Sets up a usable installation

### Notes

* install some basic apps from builtin repos
* perform updates, excluding the `filesystem` package
* setup locale (centos8)
* set timezone to America/Los-Angeles (centos8)
* copy `.vimrc`, `.gitconfig`, `.bashrc`
* enable systemd services `sshd`, `chronyd` on boot
* maybe install `telegraf` or `fail2ban`

### Vars

| var                | value                                                      |
|--------------------|------------------------------------------------------------|
| fail2ban_destemail | where fail2ban should send emails to                       |
| influxdb_urls      | where to send metrics to                                   |
| telegraf           | telegraf configuration (openweathermap::{app_id, city_id}) |
