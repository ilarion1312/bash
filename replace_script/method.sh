#!/bin/bash

# Write log to file 
log(){
	local date=$1
	local log_message=$2
	echo "$date $log_message" >> /var/log/method.log
	
}

# Method find words in txt files in the directory and change all words and write in log file 
replace() {

	files=($(find $1 -maxdepth 1 -name "*.txt"))
        for file in "${files[@]}"; do
                log "file is $file found"
                sed -i "s/$2/$3/g" $file
                log "All $2 replaced to $3"
           
        done
log "*****************END SCRIPT********************************"

}

# Method check directory when directory found he calls the methods "log" and "replace" else write into log "File is not found" 
check(){
	log "******************START SCRIPT*****************"
if [ -d $1 ]; then
	log $(date +'%H:%M:%S') "Directory $1 is exist" # Write into log file time and name  what he found 
	replace "$1" "$2" "$3"
else
	log $(date +'%H:%M:%S') "Directory $1 is not exist"
fi
}

check "$@"
