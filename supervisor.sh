#!/bin/bash

echo "[Docker supervisor] Started"
echo "[Docker supervisor] Sleeping"
sleep 20
echo "[Docker supervisor] Configuring virtual host"
chmod +x /lampstack-docker-config/generate-virtualhost.sh && /lampstack-docker-config/generate-virtualhost.sh
