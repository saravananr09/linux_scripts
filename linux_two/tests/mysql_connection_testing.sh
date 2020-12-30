#! /bin/bash


set -x

path="/mnt/e/linux_script_pratices/other"
mysql="/mnt/e/back/vicky/mysql_base/bin/mysql -u root -S /tmp/mysql78.sock"
$mysql -e"select id from world.city;" -s -N > $path/ids.txt
total=`cat $path/ids.txt | wc -l`
i=1
while [ $i -le $total ]

do

id=`cat $path/ids.txt |head -$i | tail -1 | awk  -F" " '{print $1}'`
uid=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 9 ; echo ''`
echo "$uid";

sleep 2
quantity=`shuf -i 0-1000 -n 1`
min_quantity=`shuf -i 0-100 -n 1`
max_quantity=`shuf -i 0-1000 -n 1`
retail_price=`shuf -i 0-1000 -n 1`
purchase_price=`shuf -i 0-1000 -n 1`
whole_sale_price=`shuf -i 0-1000 -n 1`
taxable_price=`shuf -i 0-1000 -n 1`
mrp=`shuf -i 0-1000 -n 1`
discount_price=`shuf -i 0-1000 -n 1`
site_mrp=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 9 ; echo ''`
mapping_key=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 9 ; echo ''`
# echo "{|Trichy|: |$quantity|, |Chennai|: |$min_quantity|, |Madhurai|: |$max_quantity|, |nagercoil|: |$retail_price|}" > $path/godown.txt
# sed -i 's/|/"/g' $path/godown.txt
# godown=`cat $path/godown.txt`





#  echo $uid , $quantity, $mapping_key, $discount_price, $id;
# sleep 25

echo "insert world_two.city  values($id ,'$uid', '$quantity', '$mapping_key', $discount_price);" >> $path/inserts.sql 2>inserts.err
$($mysql world_two < $path/inserts.sql) &


# $($mysql -e "insert world_two.city  values($id ,\'$uid\', $quantity, $mapping_key, $site_mrp)";) &

# $($mysql -e "insert world_two.city  values(Name=$uid, CountryCode=$quantity, District=$mapping_key, Population=$site_mrp) where ID=$id;" 2> $path/script.err) &

# update world_two.city set uid='$uid', Name='$uid', CountryCode='$quantity', District='$mapping_key', Population='$site_mrp' where id=$id;" > $path/updates.sql) &
((i++))
done
exit 0























# date=$(date);
# dumpe=$($date | cw | head -1 | cut -f 4 -d ',' ut -d " " )
# echo "dump $dumpe";


# MYSQL="/mnt/e/back/vicky/mysql_base/bin"
# USER="root"
# SOCKET="/tmp/mysql78.sock"
# # set -x
# mysql_connection="$MYSQL/mysql -u $USER -S $SOCKET"
# table="tablename"
# date=$($mysql_connection -sN -e 'select now();'| awk ' { print $1 "_" $NF } ');
# #echo "dump_$date"_$table.sql;


# echo '#######################################################'
# # date=$(date);
# # echo $date |  sed -e "s/^ *//" 

# # nice_date='+%Y-%m-%d %H:%M:%S'
# # echo "dump_$date"| awk ' { print $0 $1 "-" $NF } '
# # echo "$(date "$nice_date")"



# set -x
# filess=/mnt/e/linux_script_pratices/bkup_from_script/dump_details_2020-12-21_11:27:36.sql
# if [ -s "$filess" ]; then
#     echo "$filess exists."
# else
#     echo "Failed "
# fi
# # echo $file;


