#!/bin/bash
# Script to display the running containers in Lab

clear
echo -e "-------------------------------------"
echo -e "Internal Hacking Network: 10.6.6.0/24"
echo -e "Your bridge networks:"
ip -c -brie a | grep 10.6.6.1
ip -c -brie a | grep 10.6.7.1

echo -e "
The following are tht vulnerable containers and associated IP addresses.
+--------------------+------------+
|     Container      | IP Address |
+--------------------+------------+
| webgoat            |  10.6.6.11 |
| juice-shop         |  10.6.6.12 |
| dvwa               |  10.6.6.13 |
| mutillidae_2       |  10.6.6.14 |
| dvna               |  10.6.6.15 |
| hackazon           |  10.6.6.16 |
+--------------------+------------+ "

echo -e "The following are the \e[92mrunning \e[39mcontainers with their associated ports:"
docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"
