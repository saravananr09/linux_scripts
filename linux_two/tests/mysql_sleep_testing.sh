#! /bin/bash
echo "pid is : $$"
read -p "Enter the query count : " n
read -p "Enter the time U want : " t
read -p "Enter the chunk U want: " c

fire()
{
        for sleeps in $(eval echo "{1..$n}")
        do
           echo $sleeps;
           $(/mnt/e/back/vicky/mysql_base/bin/mysql -u proxy_tester -ptest -h 127.0.0.1 -P 6033 -sN -e "select * from proxysql_testing.city limit ${t}" > /home/saravanan/scripts/query_sleep_junks.txt ) &
        #    $(/mnt/e/back/vicky/mysql_base/bin/mysql -u proxy_tester -ptest -h 127.0.0.1 -P 6033 -sN -e "select sleep(${t})" > /home/saravanan/scripts/query_sleep_junks.txt 2> /home/saravanan/scripts/quer.err | grep -v '0' ) &
        done
}

i=1;
while [ $i -le $c ]; do
        echo "sleep chunk $i";
        fire
        sleep 10
        ((i++))
done
exit 0
