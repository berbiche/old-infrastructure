# Infrastructure

This repository embodies the configuration I use for my home lab and VPS server.

## Deploying

My secrets are managed with bitwarden and requires the bitwarden-cli executable
to be available in `$PATH` (`bw` executable).

To run a specific host:

``` sh
# Unlock bitwarden instance
eval "$(bw unlock | grep -oP '(export BW_SESSION=".*")')"
# Run specific host (zion in this case)
ansible-playbook zion.yml
```
