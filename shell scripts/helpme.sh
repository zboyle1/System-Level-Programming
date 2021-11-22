#!/bin/bash
#
# Zoe Boyle
# zboyle1@student.gsu.edu
# helpme.sh
# Help me
#
echo Type command                                                   # Asking for input
read command
case $command in                                                    # Case switch for input
                                                                    # Print from top of manual to bottom
	cat)
		sed -n -e '/CAT(1)/,/CAT(1)/p' mandatabase.txt      # cat
		;;
	ls)
		sed -n -e '/LS(1)/,/LS(1)/p' mandatabase.txt        # ls
		;;
	cp)
		sed -n -e '/CP(1)/,/CP(1)/p' mandatabase.txt        # cp
		;;
	mv)
		sed -n -e '/MV(1)/,/MV(1)/p' mandatabase.txt        # mv
		;;
	mkdir)
		sed -n -e '/MKDIR(1)/,/MKDIR(1)/p' mandatabase.txt  # mkdir
		;;
	chmod)
		sed -n -e '/CHMOD(1)/,/CHMOD(1)/p' mandatabase.txt  # chmod
		;;
	sed)
		sed -n -e '/SED(1)/,/SED(1)/p' mandatabase.txt      # sed
		;;
	vi)
		sed -n -e '/VI(1)/,/VI(1)/p' mandatabase.txt        # vi
		;;
	rm)
		sed -n -e '/RM(1)/,/RM(1)/p' mandatabase.txt        # rm
		;;
	sort)
		sed -n -e '/SORT(1)/,/SORT(1)/p' mandatabase.txt    # sort
		;;
	*)
		echo sorry, I cannot help you                       # Command not found in database
		;;
esac
