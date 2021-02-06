#! /bin/bash
#set -x




while [ true ]
do
sleep 1
$(/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -S /tmp/mysql78.sock -e "select * from world_two.city; " >> select_city.txt )

done 


