#!/bin/bash
pkill -KILL -u $(who | awk '{print $1}' | uniq | grep -v '^root$')