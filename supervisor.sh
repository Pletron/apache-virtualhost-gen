#!/bin/bash

echo "[Docker supervisor] Started"
echo "[Docker supervisor] Waiting 5 seconds"
sleep 5
echo "[Docker supervisor] Configuring virtual host"
chmod +x /lampstack-docker-config/generate-virtualhost.sh && /lampstack-docker-config/generate-virtualhost.sh
