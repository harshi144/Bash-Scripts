#!/bin/bash

# Check if both input files are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <file1> <file2>"
  exit 1
fi

FILE1=$1
#!/bin/bash

# Check if both input files are provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <file1> <file2>"
  exit 1
fi

FILE1=$1
FILE2=$2
OUTPUT_FILE="joined_output.txt"

# Check if the input files exist
if [ ! -f "$FILE1" ]; then
  echo "File $FILE1 not found!"
  exit 1
fi

if [ ! -f "$FILE2" ]; then
  echo "File $FILE2 not found!"
  exit 1
fi

# Sort the input files based on the first column
SORTED_FILE1="sorted_$(basename "$FILE1")"
SORTED_FILE2="sorted_$(basename "$FILE2")"

sort -k1,1 "$FILE1" > "$SORTED_FILE1"
sort -k1,1 "$FILE2" > "$SORTED_FILE2"

# Join the sorted files based on the first column and retain all columns
join -t $'\t' -1 1 -2 1 "$SORTED_FILE1" "$SORTED_FILE2" > "$OUTPUT_FILE"

# Clean up the sorted intermediate files
rm "$SORTED_FILE1" "$SORTED_FILE2"

echo "Joined file saved as $OUTPUT_FILE"
