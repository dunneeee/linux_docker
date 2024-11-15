#!/usr/bin/env bash

export HOSTNAME=$(hostname)
export IP_ADDRESS=192.168.110.177
export GITEA_ADMIN_USER="dunn"
export DRONE_RPC_SECRET="dung_drone_secret"
export DRONE_USER_CREATE="username:${GITEA_ADMIN_USER},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
export DRONE_GITEA_CLIENT_ID="d252837a-ffcd-49b3-a31d-aa96f0298fcf"
export DRONE_GITEA_CLIENT_SECRET="QbKmXCsc0RhCCjr7uu1szJRdAESYlE96X9vYqMymE6s="
docker-compose up -d

echo ""
echo "Gitea: http://${IP_ADDRESS}:3000/"
echo "Drone: http://${IP_ADDRESS}:3001/"
