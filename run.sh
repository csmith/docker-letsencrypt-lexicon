#!/usr/bin/env bash

interrupt() {
  echo
  echo "Caught ^C, exiting."
  exit 1
}

trap interrupt SIGINT

while true; do
  /letsencrypt.sh --cron --hook /lexicon.sh --challenge dns-01 
  inotifywait --timeout 86400 /letsencrypt/domains.txt
  sleep 60
done
