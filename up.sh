#!/usr/bin/env bash

get_ipv4() {
  ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v '127.0.0.1' | head -n 1
}

export HOSTNAME=$(hostname)
export IP_ADDRESS=$(get_ipv4)
export GITEA_ADMIN_USER="dunn"
export DRONE_RPC_SECRET="dung_drone_secret"
export DRONE_USER_CREATE="username:${GITEA_ADMIN_USER},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
export DRONE_GITEA_CLIENT_ID="839a8c5c-cd30-4e93-95c0-3c1ffbd8f621"
export DRONE_GITEA_CLIENT_SECRET="-OEDgsqS6Igwu2OsylrEJ17HYgkwPMGEWC1SeLMx6Vc="

docker-compose up -d

echo ""
echo "Gitea: http://${IP_ADDRESS}:3000/"
echo "Drone: http://${IP_ADDRESS}:3001/"
