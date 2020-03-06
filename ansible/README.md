# Installation

Ansible has to be installed on the host beforehand and the user that will be
used by Ansible too.

Install Ansible:

``` sh
# apt install ansible
```

Create the user:

``` sh
# adduser --disabled-password --gecos "" automation
# sudo -u automation mkdir -m 0700 -p /home/automation/.ssh
# SSH_AUTHORIZED_KEY=''
# sudo -u automation tee -a /home/automation/.ssh/authorized_keys <<<$SSH_AUTHORIZED_KEY
```

## Running

The following command takes place in the project root:

``` sh
nix-shell shell.nix
cd ansible
```

Install ansible-galaxy roles (on the current host):

``` sh
ansible-galaxy install -r ./roles.yml
```

Run:

``` sh
ansible-playbook --vault-password-file FILE --diff zion.yml
```

Or check:

``` sh
ansible-playbook --vault-password-file FILE --check --diff zion.yml
```
