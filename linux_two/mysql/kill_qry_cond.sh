#!/bin/bash 
# set -x
DATE=$(date +%d-%m-%Y)
backup_path="/mnt/e/linux_script_pratices/conditional_backupscripts"
MYSQL_USER="root"
MYSQL_PASSWORD=""
MYSQL=/mnt/e/back/vicky/mysql_base/bin/mysql
SOCKET=/tmp/mysql78.sock
# DB_name=db1
# error="/tmp/bkp.err"


# query=$($MYSQL -u $MYSQL_USER -S $SOCKET -e "";")
# select * from information_schema.processlist where TIME>10 and `INFO` LIKE '%select%';
# select * from information_schema.processlist where TIME>10 and `INFO` NOT LIKE '%where%';


# echo $(printf "%s %s", "kill $query")

chk_time(){
    query=$(mysql -u root -S /tmp/mysql78.sock -sN -e "select ID, INFO, TIME from information_schema.processlist where TIME>10 and `INFO` LIKE '%select%';" | awk '{print $1}' )
    q_id=($query)
    # echo ${!q_id[@]}
    set -x
    for kill in ${!q_id[@]}
    do  
        $MYSQL -u $MYSQL_USER -S $SOCKET -e "kill ${q_id[$kill]}";
    done
}

chk_where(){
        set -x

    query=$(mysql -u root -S /tmp/mysql78.sock -sN -e "select ID, INFO, TIME from information_schema.processlist where TIME>10 and `INFO` NOT LIKE `%where%`;" | awk '{print $1}' )
    q_id=($query)
    # echo ${!q_id[@]}
    for kill in ${!q_id[@]}
    do  
        $MYSQL -u $MYSQL_USER -S $SOCKET -e "kill ${q_id[$kill]}";
    done
}

chk_where











# echo $count
# len=${#query}
# echo $len;

sleep 10

for val in 
do
    echo $val;

done

