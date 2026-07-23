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

# copy() instead of link() for files the workspace's startup_script writes
# through (git identity, venv/direnv/bash_aliases lines). Symlinking them makes
# those writes land inside this clone, dirtying the tree so the next
# `coder dotfiles` run can't `git pull` and silently uses a stale install.sh.
# A copy keeps the clone clean; edits to these files re-copy on next start.
copy() {
  local src="$DOTFILES_DIR/$1"
  local dst="$HOME/$1"
  # Replace a stale symlink from a previous install so the copy isn't written
  # back through it into the clone.
  [ -L "$dst" ] && rm -f "$dst"
  cp -f "$src" "$dst"
  echo "copied $1"
}

copy .bashrc
copy .gitconfig
link .coder-shutdown.sh
