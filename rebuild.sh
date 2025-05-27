#!/usr/bin/env bash
set -e

REPO_DIR=~/dotfiles
CONFIG_DIR=~/dotfiles/nixos
cd "$CONFIG_DIR"

echo "Formatting .nix files..."
alejandra .

cd "$REPO_DIR"

echo "Showing diffs > "
git diff -U0 '*.nix'

read -rp "Proceed with rebuild and commit? [y/N] > " confirm
if [[ ! "$confirm" =~ ^[Yy]$  ]]; then
  echo "Aborted"
  exit 1
fi

echo "Rebuilding NixOS..."
git add nixos/
sudo nixos-rebuild switch --flake ~/dotfiles/nixos

current=$(nixos-rebuild list-generations | grep current)

git commit -am "$current"
git push origin main

echo "✅ Rebuild successful and changes pushed."