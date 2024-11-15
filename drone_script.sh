#!/usr/bin/env bash

export DRONE_SERVER="http://192.168.43.36:3001"
export DRONE_TOKEN="dung_drone_secret"
REPO="dunn/web_app"

function show_usage() {
  echo "Usage: $0 {logs|repos|users|register|info}"
  exit 1
}

if [ $# -eq 0 ]; then
  show_usage
fi

case "$1" in
logs)
  drone build info "$REPO"
  ;;
repos)
  drone repo ls
  ;;
users)
  drone user ls
  ;;
register)
  drone repo add "$REPO"
  ;;
info)
  drone repo info $REPO
  ;;
*)
  show_usage
  ;;
esac
