#!/bin/bash
if [ $# -eq 0 ]  

   then echo "usage :check_if_file_exist filename"
   exit 1
   else if [ $# -eq 1  ]   
            then if  [ -f $1 ]
                then echo "$1 file exist"
                    else echo "no this file: $1" 
                echo "\n"
               if  [ $# -ge 0 ]  
                   then 
                    {  echo "dfdf,:wq $#"
                   for i in [2..$#] 
                   do  echo  "file $i "
                   done;
                   }    
      fi
     fi
   fi
fi
