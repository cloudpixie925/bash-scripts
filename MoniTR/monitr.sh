#!/bin/bash

set -o history
HISTFILE=~/.bash_history
history -r

#Checks memory usage and internet connectivity
syscheck(){
    free -h
    ping -c 1 8.8.8.8
    if [ $? -eq 0 ]; then
        echo "NETWORK IS UP"
    else
        echo "NETWORK IS DOWN"
    fi
}

#Finds all logs in /var/log and archives them
filehunter(){
    mapfile -t LOG_FILES < <(find "/var/log" -name "*.log")
    for LOG_FILE in "${LOG_FILES[@]}"; do
        zip -j "sys_logs.zip" "$LOG_FILE"
    done
    zip -sf "sys_logs.zip" >> archived_list.txt


}

#Handles process or history commands
process_manager(){
    case ${1,,} in
        top)
            top
            ;;        
        history)
            history
            ;;
        *)
            echo "Invalid command"
    esac
}

echo "Which module would you like to run?(sys/files/proc)"
echo "If your module is proc, please enter if you want top/history after proc"

read MODULE ARGUMENT
echo $MODULE
if [ "$MODULE" = "sys" ]; then
    syscheck
elif [ "$MODULE" = "files" ]; then
    filehunter
elif [ "$MODULE" = "proc" ]; then
    process_manager "$ARGUMENT"
else
    echo "Please enter the correct module"
fi