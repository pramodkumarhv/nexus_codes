#!/bin/bash

# Prompt user for application name
read -p "Enter the application name: " application

# Use the find command to search for the application in the specified directory
find . -type f -name "$application"

# Check if the application was found
if [ $? -eq 0 ]; then
    
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
