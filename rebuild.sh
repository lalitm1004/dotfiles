#!/usr/bin/env bash
set -e

CONFIG_DIR=~/dotfiles/nixos
cd "$CONFIG_DIR"

echo "Formatting .nix files..."
alejandra .

echo "Showingdiffs > "
git diff -U0 '*.nix'

read -rp "Proceed with rebuild and commit? [y/N] > " confirm
if [[ ! "$confirm" =~ ^[Yy]$  ]]; then
  echo "Aborted"
  exit 1
fi

echo "Rebuilding NixOS..."
sudo nixos-rebuild switch --flake ~/dotfiles/nixos &>nixos-switch.log || {
  grep --color error nixos-switch.log || cat nixos-switch.log
  exit 1
}

current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"
git push origin main

echo "✅ Rebuild successful and changes pushed."
