# !/bin/bash
#
# phonebook.sh
# Phonebook utility
# Zoe Boyle
# zboyle1@student.gsu.edu
#
# Added colors
#
# Color variables
TITLE="\e[31m"
BOLDTITLE="\e[1;${TITLE}"
OPTIONS="\e[33m"
NC="\e[0m"

# Greeting message
echo -e "${TITLE}Hello, welcome to the Phonebook Utility${NC}"
# Continue until exit
while [ "$input" != "4" ]
do
	# Prompt user for phonebook option
	echo -e "\n${BOLDTITLE}Main Menu${NC}\n---\n${TITLE}Options:${NC}\n${OPTIONS}1.${NC}View Phonebook ${OPTIONS}2.${NC}Find Contact ${OPTIONS}3.${NC}Edit Phonebook ${OPTIONS}4.${NC}Exit"  # prompt user for choice
	read input

	# Case switch for options
	case $input in
		# Display phonebook in alphabetical order and formatted
		1) 
			sort phonebook.txt | awk -F',' 'BEGIN { 
			printf "\033[33m%-20s,%-40s,%s \n","Name","Address","Phone Number\033[0m"; 
			printf "%-20s,%-40s,%s \n","----","-------","-----------" 
			} 
			{ printf "\033[34m%-20s\033[0m,%-40s,%d \n",$1,$2,$3 }' | sed 's/,//g'
			;;

		# Find contact
		2) 
			echo -e "${OPTIONS}Enter Contact Name:${NC}"
			read name 
			grep "$name" phonebook.txt | sed 's/,/ /g'
			;;

		# Enter edit menu
		# Prompt for user option
		3) echo -e "\n${BOLDTITLE}Edit phonebook Menu${NC}\n---\n${TITLE}Options:${NC}\n${OPTIONS}1.${NC} Edit contact ${OPTIONS}2.${NC} Add contact 
		${OPTIONS}3.${NC} Delete contact ${OPTIONS}4.${NC} Cancel"
		read input2

			# Edit existing contact
    			if [ $input2 == 1 ]
    			then
				# Find and display contact to be edited
				echo -e "${OPTIONS}Enter Contact Name:${NC}"
				read name
				grep "$name" phonebook.txt | sed 's/,/ /g'
				# Prompt user for where the edit should be
				echo -e "\n${TITLE}Change which field?${NC}\n---\n${OPTIONS}1.${NC}Name ${OPTIONS}2.${NC}Address ${OPTIONS}3.${NC}Phone Number ${OPTIONS}4.${NC}Cancel"
				read input3

 				# Change contact name
				if [ $input3 == 1 ]
				then
					# Ask user for new name and replace the line in phonebook
					read -p "New Name: " nname
					oldline=`grep "$name" phonebook.txt`
					newline=`echo $oldline | sed "s/$name/$nname/g"`
					sed -i "s/$oldline/$newline/g" phonebook.txt
					name=$nname

				# Change contact address
				elif [ $input3 == 2 ]
				then
					# Ask user for new address and replace the line in phonebook
					read -p "New Address: " add
					oldline=`grep "$name" phonebook.txt`
					newline=`echo $oldline | sed "s/,.*,/,$add,/g"`
					sed -i "s/$oldline/$newline/g" phonebook.txt

				# Change contacts phone number
				elif [ $input3 == 3 ]
				then
					# Ask user for new number and replace the line in phonebook
					read -p "New Number: " num
					oldline=`grep "$name" phonebook.txt`
					newline=`echo $oldline | sed "s/[0-9]*$/$num/g"`
					sed -i "s/$oldline/$newline/g" phonebook.txt

				# Exit to main menu
				elif [ inpt3==4 ]
				then
					continue

				# Invalid input
				else
					echo "Invalid"
				fi

			# Display updated contact info
			echo -e "${BOLDTITLE}Updated Contact Information:${NC}"
			grep "$name" phonebook.txt | sed 's/,/ /g'
			continue

			# Add new contact
			elif [ $input2 == 2 ]
			then
				echo -e "${OPTIONS}Enter new contact information:${NC}"
				# Inut name
				read -p "Name: " name
				# Input address
				read -p "Adress: " add
				# Input Number
				read -p "Number: " num
				# Append new contact info to phonebook.txt
				echo $name,$add,$num >> phonebook.txt
				continue

			# Delete contact
			elif [ $input2 == 3 ]
			then
				# Prompt user for contact name
				echo -e "${OPTIONS}Enter contact name:${NC}"
				read name
				# Delete line with contact, store output to temporary file
				sed "/$name/d" phonebook.txt > temp
				# Change temporary file to main phonebook database
				mv temp phonebook.txt

			# Return to main menu
			elif [ $input2 == 4 ]
			then
				continue

			# Invalid input
			else
				echo -e "${OPTIONS}Invalid${NC}"
				continue
			fi
			;;

		# Exit
		4)
			;;

		# Invalid Input
		*) 
			echo -e "${OPTIONS}Not an option${NC}"
			;;
	esac
done
