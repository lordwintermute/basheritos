#!/bin/bash
# This script finds .webp files in a specified directory (or the current directory if not provided),
# converts them to .png, and deletes the original .webp files.

# Determine the directory (use the first command-line argument if provided, otherwise default to the current directory)
directory="${1:-$(pwd)}"

# Use the 'find' command to locate .webp files in the specified directory
find "$directory" -type f -name "*.webp" -print0 | while read -d $'\0' file
do
    # Use 'convert' to convert the .webp file to .png, removing the .webp extension
    convert "$file" "${file%.webp}.png"

    # Check if the conversion was successful
    if [ $? -eq 0 ]; then
        echo "Converted: $file"
        
        # Remove the original .webp file
        rm "$file"
        echo "Deleted: $file"
    else
        echo "Error converting: $file"
    fi
done

# Optionally, you can add an exit message
echo "Conversion and deletion complete."
