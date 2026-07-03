syscheck(){
    free -h
    ping -c 1 8.8.8.8
    if [ $? = 0 ]; then
        echo "NETWORK IS UP"
    else
        echo "NETWORK IS DOWN"
    fi
}
filehunter(){
    LOG_FILES=($(find "/var/log" -name "*.log"))
    for LOG_FILE in "${LOG_FILES[@]}"; do
        zip -j "sys_logs.zip" "$LOG_FILE"
        zip -sf "sys_logs.zip" >> archived_list.txt
    done


}
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
read MODULE
echo $MODULE | rev
if [ "$MODULE" = "sys" ]; then
    syscheck
elif [ "$MODULE" = "files" ]; then
    filehunter
elif [ "$MODULE" = "proc" ]; then
    process_manager
else
    echo "Please enter the correct module"