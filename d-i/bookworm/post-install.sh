#! /bin/bash

# Set up the public key
mkdir -p -m 700 /target/home/klipper/.ssh
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPUkFk7oQYanQ+zo65e+RTEGJ1vVzqdbV5COMBZxjTR3' > /target/home/klipper/.ssh/authorized_keys
chown -R klipper:klipper /target/home/klipper/.ssh/
chmod 644 /target/home/klipper/.ssh/authorized_keys

# Make the klipper user not need a password for sudo
echo 'klipper ALL=(ALL) NOPASSWD: ALL' > /target/etc/sudoers.d/klipper
chmod 440 /target/etc/sudoers.d/klipper

# Add IP address to login screen
echo 'IP: \4' >> /target/etc/issue
