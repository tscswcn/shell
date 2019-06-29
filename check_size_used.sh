#! /bin/sh  - 
      clear
echo "		-----------------MENU------------------"
echo
echo "		1.Find files modified in last 24 hours"
echo "		2.The free disk space"
echo "		3.Space consumed by this user"
echo "		4.Exit"
echo 		
echo -n "		Select:"
read choice
case $choice in
1)find $HOME -mtime -1 -print;;
2)df;;
3)sudo du -s $HOME;;
4)exit;;
*)echo "Invalid option"
esac
