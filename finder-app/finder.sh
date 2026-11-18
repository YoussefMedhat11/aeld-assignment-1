#!/bin/sh
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Count all regular files recursively
X=$(find "$filesdir" -type f | wc -l)

# Count lines containing the search string
Y=$(find "$filesdir" -type f -exec grep -F -c -- "$searchstr" {} + | awk -F: '{sum += $NF} END {print sum+0}')

# Print the result
echo "The number of files are $X and the number of matching lines are $Y"

exit 0