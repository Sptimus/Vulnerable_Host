#!/usr/bin/env bash

#Installing splunk
docker run -d -p 8000:8000 -p 8080:8080 -e "SPLUNK_START_ARGS=--accept-license" -e "SPLUNK_PASSWORD=admin" --name splunk splunk/splunk:latest