# !/bin/bash
#
# findSentence.sh
# Count the number of sentences
# Zoe Boyle
# zboyle1@student.gsu.edu
#
# Remove elipses and reference numbers.
# Seperate the lines, remove headers and empty lines.
# Pipe to word count to find number of sentences
sed 's/\.\.\./ /g' myexample.txt | sed 's/\[.*\]//g' | sed 's/\./\.\n/g' | sed '/[^\.?!,]$/d' | sed -r '/^\s*$/d' | wc -l
