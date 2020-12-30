#!/bin/bash
#set -x
DATE=$(date +%d-%m-%Y)
backup_path="/mnt/e/linux_script_pratices/conditional_backupscripts"
MYSQL_USER="root"
MYSQL_PASSWORD=""
MYSQL=/mnt/e/back/vicky/mysql_base/bin/mysql
MYSQLDUMP=/mnt/e/back/vicky/mysql_base/bin/mysqldump
SOCKET=/tmp/mysql78.sock
DB_name=db1
error="/tmp/bkp.err"

cat input.txt | awk '{print $1}' >tablename_list.txt
cat input.txt | cut -f 2 -d '=' > condition_list.txt

table_count=`cat table_name.txt | wc -l`
cond_count=`cat condition_name.txt | wc -l`

for ((i=1;i<=$table_count;i++))
do
	j=1

	tablename=`cat tablename_list.txt|head -$i|tail -$j`
	tablecond=`cat condition_list.txt|head -$i|tail -$j`

	$MYSQLDUMP -u$MYSQL_USER -S$SOCKET --max-allowed-packet=100M --quick --extended-insert --complete-insert --single-transaction --skip-tz-utc --skip-add-drop-table --no-create-info --databases $DB_name --tables $tablename --where="$tablecond" >$backup_path/$tablename-${DATE}.sql 2>$error

done

error=`cat $error| grep -v 'Using a password' | wc -l`

if [[ "$error" -eq 0 ]];

then

	echo "successful" >/tmp/status.log

else

	echo "failed" >/tmp/status.log
fi
exit 0

