docker run -d --mount source=logs-webgoat,target=/mnt/webgoat --mount source=logs-juice-shop,target=/mnt/juice-shop --mount source=logs-mutillidae_2,target=/mnt/mutillidae_2 --mount source=logs-dvwa,target=/mnt/dvwa --mount source=logs-hackazon,target=/mnt/hackazon -p 8000:8000 -p 8080:8080 -e "SPLUNK_START_ARGS=--accept-license" -e "SPLUNK_PASSWORD=Adam1000" --name splunk splunk/splunk:latest

