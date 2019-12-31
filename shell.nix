{ pkgs ? import <nixpkgs> {} }:

with pkgs;

mkShell {
  buildInputs = [
    ansible_2_7
  ];

  shellHook = ''
    echo Ansible aware shell
    ${ansible_2_7}/bin/ansible-playbook --version
  '';
}
