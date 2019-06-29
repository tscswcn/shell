	read a b
	for i in `seq $a $b`
	do
		echo `expr $i \* 10`
	done
         echo $*

