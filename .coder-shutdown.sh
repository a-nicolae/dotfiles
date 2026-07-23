#!/bin/bash
# Personal Coder workspace shutdown hook (Andrei).
# Symlinked to ~/.coder-shutdown.sh by `coder dotfiles` and run on workspace stop.
# Log to both the agent shutdown logs and a file on the persistent home volume,
# so the run can be confirmed at next start (agent logs may vanish once the pod dies).
echo "andrei's shutdown hook ran — workspace stopping at $(date -u '+%Y-%m-%dT%H:%M:%SZ')" \
  | tee -a "$HOME/.coder-shutdown.log"
