#!/bin/bash

# path to log file where we want to  stdout and stderr on error
LOG_FILE="$1";

output="$(
    # exit sub shell with non zero exit 
    set -ex; 
    {
      "$2"
    } 2>&1;
)";

# get sub shell exit code
# save error if any
# exit with error code if any
# or exit 0;
ec="$?"; if [ $ec -eq 0 ]; then 
    # zero exit code
    
    exit 0; 
else
    # non zero exit code

    echo $output;
    
    # if path to it was provided
    if [ -n "$LOG_FILE" ]; then
        NOW=$( date )
        echo -e "$NOW: $output\n" >> "$LOG_FILE";
    fi;
    
    # call echo2ui to output the error message
    ./echo2ui "Context" "Title" "$output" 60 20

    # exit with sub shell exit code
    exit "$ec"; 
fi;
