# !/bin/bash
#
# Zoe Boyle
# zboyle@student.gsu.edu
# calculator.sh
# Calculator
#
while [ "$expr" != "cancel" ]                                                  # Run calculator
do
	echo "Please enter the expression:"                                    # Asking for input
	read expr
	case $expr in                                                          # Case switch for operations
		*+*) 
			echo $expr | awk -F + '{print $1,"+",$2,"=",($1+$2)}'  # Addition
			;;
		*\**) 
			echo $expr | awk -F* '{print $1,"*",$2,"=",($1*$2)}'   # Multiplication
			;;
    		*-*) 
			echo $expr | awk -F - '{print $1,"-",$2,"=",($1-$2)}'  # Subtraction
    			;;
    		*/*) 
			echo $expr | awk -F / '{print $1,"/",$2,"=",($1/$2)}'  # Division
    			;;
		*%*) 
			echo $expr | awk -F % '{print $1,"%",$2,"=",($1%$2)}'  # Modulo
			;;
		clear) 
			clear                                                  # Clear the screen
			;; 
		cancel)                                                        # Exit the calculator
			;;
		*) 
			echo "Please try again"                                # Invalid input. Prompt for expression again
			;;
	esac
done
