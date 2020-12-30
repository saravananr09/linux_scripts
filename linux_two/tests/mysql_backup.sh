#!/bin/bash 
###################################################################################
MYSQL="/mnt/e/back/vicky/mysql_base/bin"
USER="root"
SOCKET="/tmp/mysql78.sock"
mysql_connection="$MYSQL/mysql -u $USER -S $SOCKET"
backup_path="/mnt/e/linux_script_pratices/bkup_from_script"

###################################################################################
#function to fetch data about the tables
get_tables_dump(){
	PS3="type any index of the above table "
	local info_tables=($($MYSQL/mysql -uroot -S $SOCKET -sN -e "show tables from $DB"))
			select table in ${info_tables[*]}
			do
				case $table in				
					$table)
						echo "You have selected the $table table";
						echo "#####################################################################"
						echo -e "\033[1;34m starting dump for $table table... \e[0m"
						date=$($mysql_connection -sN -e 'select now();'| awk ' { print $1 "_" $NF } ')
						#$($MYSQL/mysqldump -u $USER -S $SOCKET $DB $table > $backup_path/"dump_$table"_$date.sql ) &
						dump_file=$backup_path/"dump_$table"_$date.sql
						echo -e "\033[1;33m $dump_file\e[0m";
						echo -e "\033[1;34m dump completed ! \e[0m"
						echo "#####################################################################"
						get_databases
						break;;
					*)
						echo "Invalid option $table";;	
				esac
			done
}

#getting DB's
get_databases() {
	echo -e "########################${RED} Mysql Backup \e[0m ##############################\n"
	local mysql_db=$($mysql_connection -sN -e "show databases;" )
	PS3="Please select the Database: "
	
	select DB in ${mysql_db[*]}
	do
	echo -e "########################\033[0;31m Mysql Backup \e[0m ##############################\n"
	case $DB in
		$DB)
			echo -e "You have selected the\033[1;33m $DB\e[0m database ! \n"
			#info_tables=($($MYSQL/mysql -uroot -S $SOCKET -e "show tables from $DB")) 
			echo -e "Tables ==> \n"
			get_tables_dump $DB
			break 2;;&	
        *) 
			echo "invalid option $DB";;
	esac			
done
}

#calling main function
get_databases





















# echo 'Mysql Dump script and my running pid :' $$

# mysql_db=('mysql' 'info_schema' 'perfo_schema')

# #echo ${mysql_db[*]}

# #echo "You have selected ${mysql_db[1]} DB"


# set -x
# array=( item1 item2 item3 )
# for index in ${!array[@]}; do
# 	    echo ${array[$index]}/${#array[@]}
# done


