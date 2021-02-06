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
set -x
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
    
    cond="'%where%'";
    query=$(mysql -u root -S /tmp/mysql78.sock -sN -e "select ID, INFO, TIME from information_schema.processlist where TIME>10 and INFO NOT LIKE $cond;" | awk '{print $1}' )
    q_id=($query)
    echo $query;
    # echo ${!q_id[@]}
    sleep 10
    for kill in ${!q_id[@]}
    do  
        echo "killed ! ${q_id[@]}";
        # $MYSQL -u $MYSQL_USER -S $SOCKET -e "kill ${q_id[$kill]}";
    done
}

declare -A field

chk_test(){
    
    cond="'%where%'";
    query=$(mysql -u root -S /tmp/mysql78.sock -sN -e "select ID, INFO, TIME from information_schema.processlist where TIME>10 and INFO NOT LIKE $cond;"  )
    sleep 1
    printf " %s","${query[0]}";
    sleep 10
    field['ID']=${query[0]}
    echo ${field['ID']}
    sleep 10
    queryids=`echo $query |awk '{print $1}'`
    q_id=($queryids)
    sleep 1
    echo ${q_id[1]};
    sleep 10
    for kill in ${!q_id[@]}
    do  
        echo "killed ! ${q_id[@]}";
        # $MYSQL -u $MYSQL_USER -S $SOCKET -e "kill ${q_id[$kill]}"; awk '{print $1}'
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

