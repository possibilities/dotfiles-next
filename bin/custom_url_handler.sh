#!/bin/bash

TELEGRAM_EXECUTABLE="/opt/Telegram/Telegram -many -workdir /media/veracrypt1/telegram/profiles-new/${1}"

if [[ $1 == https://t.me/* ]]; then
  "${TELEGRAM_EXECUTABLE}" -- "$1"
else
  xdg-open "$1"
fi
