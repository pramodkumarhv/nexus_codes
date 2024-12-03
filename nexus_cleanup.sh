#!/bin/bash

# Prompt user for application name
read -p "Enter the application name: " application

# Check if application exists
if [ -f "$application" ]; then
    
    # Prompt user for version_file
    read -p "Enter the version_file: " version_file
    # Prompt user for log_file
    read -p "Enter the log_file: " log_file

        # Read paths from the file
        while read path
        do 
                cd "$path"
                pwd >> "/nexus/versioncleanup/logs/$log_file"

                # Remove files listed in version_file
                for i in `cat /nexus/versioncleanup/$version_file` ;
                do
                    rm -rfv "$i" >> "/nexus/versioncleanup/logs/$log_file"
                done
        done < "$application"
   
else
    echo "$application does not exist."
fi
