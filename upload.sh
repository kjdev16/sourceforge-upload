#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <local_path> <sourceforge-project> <release-directory>"
    exit 1
fi

# Assign arguments to variables
LOCAL_PATH="$1"
SF_PROJECT="$2"
RELEASE_DIR="$3"

# Set SourceForge username
SF_USERNAME="kjdev16"  # Replace with your actual SourceForge username

# Define the remote path on SourceForge
REMOTE_PATH="/home/frs/project/$SF_PROJECT/$RELEASE_DIR"

# Check if local file or directory exists
if [ ! -e "$LOCAL_PATH" ]; then
    echo "Error: Local path '$LOCAL_PATH' does not exist."
    exit 1
fi

# Upload files using rsync (it will create the directory if needed)
rsync -avP -e ssh "$LOCAL_PATH" "$SF_USERNAME@frs.sourceforge.net:$REMOTE_PATH/"

if [ $? -eq 0 ]; then
    echo "Files successfully uploaded to SourceForge."
else
    echo "Upload failed."
    exit 1
fi
