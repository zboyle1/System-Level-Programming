# !/bin/bash
#
# phonebook.sh
# Phonebook utility
# Zoe Boyle
# zboyle1@student.gsu.edu
#
# Greeting message
echo "Hello, welcome to the Phonebook Utility"
# Continue until exit
while [ "$input" != "4" ]
do
	# Prompt user for phonebook option
	echo -e "\nMain Menu\n---\nOptions:\n1.View Phonebook 2.Find Contact 3.Edit Phonebook 4.Exit"  # prompt user for choice
	read input

	# Case switch for options
	case $input in
		# Display phonebook in alphabetical order and formatted
		1) 
			sort phonebook.txt | awk -F',' 'BEGIN { printf "%-20s,%-30s,%s \n","Name","Address","Phone Number"; printf "%-20s,%-30s,%s \n","----","-------","-----------" } { printf "%-20s,%-30s,%d \n",$1,$2,$3 }' | sed 's/,//g'
			;;

		# Find contact
		2) 
			echo "Enter Contact Name"
			read name 
			grep "$name" phonebook.txt | sed 's/,/ /g'
			;;

		# Enter edit menu
		# Prompt for user option
		3) echo -e "\nEdit phonebook Menu\n---\nOptions:\n1. Edit contact 2. Add contact 3. Delete contact 4. Cancel"
		read input2

			# Edit existing contact
    			if [ $input2 == 1 ]
    			then
				# Find and display contact to be edited
				echo "Enter Contact Name"
				read name
				grep "$name" phonebook.txt | sed 's/,/ /g'
				# Prompt user for where the edit should be
				echo -e "\nChange which field?\n---\n1.Name 2.Address 3.Phone Number 4.Cancel"
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
			echo "Updated Contact Information:"
			grep "$name" phonebook.txt | sed 's/,/ /g'
			continue

			# Add new contact
			elif [ $input2 == 2 ]
			then
				echo "Enter new contact information:"
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
				echo "Enter contact name:"
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
				echo "Invalid"
				continue
			fi
			;;

		# Exit
		4)
			;;

		# Invalid Input
		*) 
			echo "Not an option"
			;;
	esac
done
