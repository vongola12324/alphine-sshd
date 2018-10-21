#!/bin/sh

# Remove exist keys
rm -rf /etc/ssh/ssh_host_*

# Regenerate SSH Host Keys
ssh-keygen -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
ssh-keygen -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
ssh-keygen -N "" -t ed25519 -f /etc/ssh/ssh_host_ed25519_key

exec "$@"