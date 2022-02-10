#!/bin/bash

echo "Installing COPR Extension"
dnf install 'dnf-command(copr)'

echo "Enabling the Caddy Repo"
dnf copr enable @caddy/caddy

echo "installing Caddy"
dnf install caddy
