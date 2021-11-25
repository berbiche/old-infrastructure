# My old server infrastructure (archived)

This repository embodies the configuration I use for my home lab and VPS server.

A rewrite (and update) of this configuration is being done using NixOps [here](https://github.com/berbiche/metacortex).

## Deploying

My secrets are managed with `git-crypt` and `ansible-vault`.

The required keys will be necessary to decrypt the repository with `git-crypt` and for `ansible` deployments.
