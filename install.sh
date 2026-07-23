#!/bin/bash
# Dotfiles install script — run by `coder dotfiles` on workspace start.
# Symlinks config files into $HOME.

set -e
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DOTFILES_DIR/$1"
  local dst="$HOME/$1"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    mv "$dst" "${dst}.bak"
  fi
  ln -sf "$src" "$dst"
  echo "linked $1"
}

link .bashrc
link .gitconfig
link .coder-shutdown.sh
