#!/bin/bash

./node_modules/.bin/foreverd start --minUptime 1000 --spinSleepTime 1000 --watch ./server.js

./node_modules/.bin/coffee -o public/js/ -cw public/coffee/