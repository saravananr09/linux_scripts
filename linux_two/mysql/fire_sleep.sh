#! /bin/bash

read -p "Enter the query count : " n
read -p "Enter the time U want : " t
read -p "Enter the chunk U want: " c

echo "echo my process id is : $$"

set -x
fire()
{
        for sleeps in $(eval echo "{1..$n}")
        do
           echo "fired sleep with the time of $t and q no $sleeps";
           `/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -S /tmp/mysql78.sock -sN -e "select sleep(${t})" > junks_from_fire_sleep.txt`
        done
}

i=1
while [ $i -le $c ]; do
        echo "sleep chunk $i";
        fire
        
        ((i++))
done