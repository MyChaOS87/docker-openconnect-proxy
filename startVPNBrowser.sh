#!/bin/bash
pwd=$(pwd)

cd $(dirname $0)
(trap 'kill 0' SIGINT; docker-compose up & google-chrome-beta --proxy-server="socks5://127.0.0.1:58443" 2>/dev/null)

cd $pwd