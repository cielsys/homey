#!/usr/bin/env bash

export USE_MOCK=true
export video_port=8092
export photoDirectory="/tmp"
export video_url="http://localhost:8092/?action=stream"
export NODE_DEBUG=true

killall -9 node
killall -9 nodejs
node  src/cockpit.js
#node app.js
