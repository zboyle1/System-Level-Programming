# !/bin/bash
#
# Zoe Boyle
# zboyle1@student.gsu.edu
# Count the number of sentences
# Count the number of words and letters in each sentence
#
# Remove elipses and  reference numbers.
# Seperate the lines, remove empty lines and headers.
# Send to here document 'out'
sed 's/\.\.\./ /g' myexample.txt | sed 's/\[.*\]//g' | sed 's/\./\.\n/g' | sed '/[^\.?!,]$/d' | sed -r '/^\s*$/d' > out

# Format tabular table
awk 'BEGIN { 
	printf "%-11s %-10s %s \n","Statement #","Words","Letters"
	printf "%-11s %-10s %s \n","-----------","-----","-------" 
	}
	{ printf "%-11d %-10d %d \n",NR,NF,length }' out
