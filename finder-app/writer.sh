#!/bin/sh
# Assign arguments to variables
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi


writefile="$1"
writestr="$2"


# Extract the directory path
writedir=$(dirname "$writefile")

# Create the directory if it doesn't exist
if ! mkdir -p "$writedir"; then
    echo "Error: Could not create directory '$writedir'." >&2
    exit 1
fi

# Create or overwrite the file with writestr
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not create file '$writefile'." >&2
    exit 1
fi

exit 0