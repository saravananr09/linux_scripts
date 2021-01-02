#!/bin/bash
# set -x
# reading version, uname, path and uid 
sysuser=$(whoami)
# read -p "Enter the version " version

# reading config 
read -p "Enter the port number for the installing mysql server " port
socket="/tmp/mysql$port.sock"
read -p "Enter the server id for the installing mysql server " server_id

read -p "give the name for installing server " uid
[[ ! -z "$uid" ]] && echo -e "uid is set to $uid" || uid="mysql_db_${server_id}";
# [[ "$uid" == " " ]] && binlog="mysql_5.7" || echo "Server name is $uid"
basedir="/home/saravanan/mysql_5.7/"
datadir="$basedir${uid}data"
# echo "$datadir and $basedir" 

# sleep 1

echo "Do you wish to enable binlog for this server?"
select yes_no in "Yes" "No"; do
    case $yes_no in
        Yes ) binlog="${uid}_instance_log"
            echo "binlog name is $binlog ";
            echo "Enter select the type of binlog format in mysql "
            select bin_for in "ROW" "MIXED" "STATEMENT"; do
                case $bin_for in
                    ROW ) bin_format="ROW"
                            break;;
                    MIXED ) bin_format="MIXED"
                             break;;
                    STATEMENT ) echo "default set to STMT"
                             bin_format="STATEMENT"
                            break;;
                esac
            done
            # echo "Binlogs are stored in following path : $mysql5_7_path$binlog"
             break;;
        No ) break;;
    esac
done
sleep 5
echo "port=$port";
echo "server-id=$server_id"
echo "basedir=$basedir";
echo "datadir=$datadir";
echo "log-bin=$binlog";
echo "binlog_format=$bin_format";
# echo "$binlog printing instance log name again"
read -p "Enter the port number for the installing mysql server " port




echo $(ls $mysql5_7_path)



######## mysql binary installation script #########

sleep 7;


if [[ "$version" == "mysql 5.7" ]]
then 
    echo "entered version is mysql 5.7 and $version"

    echo $(ls $mysql5_7_path)
sleep 7;





else
    echo "Entered unknown"
fi



























# read char; echo -e "YES\nNO\n" | grep -i $char


# read c
#  [[ "$c" == [yY] ]] && echo "YES" || echo "NO"
# [[ "$c" == [nN] ]] && echo "NO" || echo "YES"

















