touch  {1..10}.txt 
 for file in *.txt; do leftname=`basename $file .txt`; mv $file.txt  $file.doc;done  
