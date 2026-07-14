#!/bin/bash
if [ "$(id -u)" -ne 0 ]; then
    echo "You gotta run me as root!"
    exit 1
else
    # Creates Users and Groups
    getent group devteam >/dev/null || groupadd devteam
    id -u dev_alpha >/dev/null 2>&1 || useradd -m dev_alpha
    id -u dev_beta >/dev/null 2>&1 || useradd -m dev_beta
    usermod -aG devteam dev_alpha
    usermod -aG devteam dev_beta

    # Sets up permanent paths
    WORKSPACE="/opt/aksess/workspace"
    LOG_DIR="/var/log/aksess"

    # Creates directories and assigns permissions
    mkdir -p "$WORKSPACE" "$LOG_DIR"
    chgrp devteam "$WORKSPACE"
    chmod 770 "$WORKSPACE"

    # Fetches and modifies target file
    wget -O "$WORKSPACE/index.html" https://google.com
    cp "$WORKSPACE/index.html" "$WORKSPACE/index_backup.html"
    sed -i "1,4d" "$WORKSPACE/index.html"

    # Routes audit logs to persistent log directory
    grep -i -c "html" "$WORKSPACE/index.html" > "$LOG_DIR/word_count.txt"
    diff "$WORKSPACE/index.html" "$WORKSPACE/index_backup.html" > "$LOG_DIR/changes.log"
    tail "$LOG_DIR/changes.log"
fi