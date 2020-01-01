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
