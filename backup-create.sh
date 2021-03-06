#!/bin/sh

set -e

if [ -z "${BACKUP_NAME}" ]; then
  echo BACKUP_NAME environment variable is required
  exit 1
fi

duplicity \
  --include=/home/mike/.private_environment \
  --include=/home/mike/.ssh/id_ed25519 \
  --include=/home/mike/.ssh/id_ed25519.pub \
  --include=/home/mike/.gist \
  --include=/home/mike/.gist-vim \
  --include=/home/mike/.zsh_history \
  --include=/home/mike/.config/lab \
  --include=/home/mike/.config/tmuxp \
  --include=/home/mike/.config/google-chrome \
  --include=/home/mike/.config/Slack \
  --exclude="**" \
  /home/mike \
  "s3:///mike-backups-4c256a80-e412-11ec-94cf-5f96b9da8566/${BACKUP_NAME}"

echo "done creating backup."
