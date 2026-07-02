#!/bin/bash
if ! [ $(id -u) = 0 ]; then 
    echo "You gotta run me as root!"
    exit 1 
else
    getent group devteam >/dev/null || groupadd devteam
    id -u dev_alpha >/dev/null/ 2>&1 || useradd -m dev_alpha
    id -u dev_beta >/dev/null 2>&1 || useradd -m dev_beta
    usermod -aG devteam dev_alpha
    usermod -aG devteam dev_beta
    mkdir "/tmp/workspace"
    chgrp devteam "/tmp/workspace"
    chmod 770 "/tmp/workspace"
    wget -O "/tmp/workspace/index.html" https://google.com 
    cp "/tmp/workspace/index.html" "/tmp/workspace/index_backup.html"
    sed -i "1,4d" "/tmp/workspace/index.html"
    grep -i -c "html" "/tmp/workspace/index.html" > word_count.txt
    diff "/tmp/workspace/index.html" "/tmp/workspace/index_backup.html" > changes.log
    tail changes.log
fi
