{ pkgs ? import <nixpkgs> {} }:

with pkgs;
let
  #ansible-patched = ansible_2_7.override { };
in
mkShell {
  buildInputs = [
    git-crypt
    ansible_2_9
    terraform
    doctl
    graphviz                            # To use with terraform graph
  ] ++ (with terraform-providers; [
    cloudflare
  ]);

  shellHook = ''
    echo Ansible and Terraform aware shell
    ${ansible_2_7}/bin/ansible-playbook --version
    ${ansible_2_7}/bin/ansible-galaxy install -r ansible/roles.yml 2&>/dev/null
    export ANSIBLE_VAULT_PASSWORD_FILE=$HOME/.ssh/vault_key_file
    ${terraform}/bin/terraform --version
  '';
}
