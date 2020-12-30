#!/bin/bash

# write a function
fresh(){
   # t stores $1 argument passed to fresh()
   t=$1
   echo "fresh(): \$0 is $0"
   echo "fresh(): \$1 is $1"
   echo "fresh(): \$t is $t"
   echo "fresh(): total args passed to me $#"
   echo "fresh(): all args (\$@) passed to me -\"$@\""
   echo "fresh(): all args (\$*) passed to me -\"$*\""
}
 
# invoke the function with "Tomato" argument
echo "**** calling fresh() 1st time ****"
fresh Tomato
 
# invoke the function with total 3 arguments
echo "**** calling fresh() 2nd time ****"
fresh Tomato Onion Paneer
































# PS3="Enter any :"
# dbs=" mysql information_schema performance_schema"
# MYSQL="/mnt/e/back/vicky/mysql_base/bin/mysql"
# USER="root"
# SOCKET="/tmp/mysql78.sock"




# echo "Kindly select on of DB to view the tables in it! "

# select DB in mysql information_schema performance_schema
# do
# 	case $DB in
# 		"mysql")
# 	    		echo -e "You have selected the $DB database !\n";
# 			#$(/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -S /tmp/mysql78.sock -e "show tables from $DB" > /mnt/e/back/vicky/mysql_base/mysql_tables.txt ) & 
# 			#$echo $(xargs -n1 < /mnt/e/back/vicky/mysql_base/mysql_tables.txt)
# 			#$echo $( /mnt/e/back/vicky/mysql_base/mysql_tables.txt)
# 			$($MYSQL -u $USER -S $SOCKET -e "show tables from $DB" > mysql_tables.txt); 
# 			for table in $(< mysql_tables.txt)
# 			do
# 				echo "$table"
# 		  	done
# 			;;
# 		"information_schema")
# 			echo -e "You have selected the $DB database ! \n"
# 			echo $($MYSQL -uroot -S $SOCKET -e "show tables from $DB") 
# 			#info= $(grep "$1" info_tables.txt)
# 			#echo $info;
# 			for word in $(< info_tables.txt)
# 			do
# 				    echo "$word"
# 			    done
# 			;;
# 		"performance_schema")
# 			echo "You have selected the $DB database!"
# 			;;
# 		*)
# 			echo "As of now we are serving following DBs only : $dbs"
# 			break
# 			;;
# 	esac			
# done
