	#! /bin/sh -
	hour=`date|cut -c 17-18`
        echo $hour 
	if test "$hour" -ge 0 -a "$hour" -le 11; then
	   echo "Good morning!"	
	elif test "$hour" -ge 12 -a "$hour" -le 17; then
	     echo "Good afternoon!"	
	else		
	      echo "Good evening!"
	fi
