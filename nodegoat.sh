#!/bin/bash
# script to instantiate NodeGoat
curl -sSL https://raw.githubusercontent.com/Sptimus/Vulnerable_Host/main/nodegoat-docker-compose.yml > /root/NodeGoat/docker-compose.yml
cd /root/NodeGoat
docker-compose build
docker-compose up
