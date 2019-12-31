{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    ansible_2_7
  ];

  shellHook = ''
    echo Ansible aware shell
    ${ansible_2_7}/bin/ansible-playbook --version
    ${ansible_2_7}/bin/ansible-galaxy install -r ansible/roles.yml 2&>/dev/null
  '';
}
