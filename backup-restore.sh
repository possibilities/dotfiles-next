#!/bin/sh

set -e

if [ -z "${BACKUP_NAME}" ]; then
  echo BACKUP_NAME environment variable is required
  exit 1
fi

echo TODO restore selective files only

# * Ssh key
# * Zsh history
# * Gist creds
# * Slack creds
# * Browser meta

# duplicity \
#   --force \
#   "s3:///mike-backups-4c256a80-e412-11ec-94cf-5f96b9da8566/${BACKUP_NAME}" \
#   /home/mike
