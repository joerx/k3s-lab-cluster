#!/bin/sh

SSH_PUB_KEY=$(cat ~/.ssh/id_ed25519.pub)

cat << EOF > user-data
#cloud-config

users:
  - name: centos
    ssh_authorized_keys:
      - ${SSH_PUB_KEY}
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups:
      - wheel
      - sudo
    shell: /bin/bash
EOF
