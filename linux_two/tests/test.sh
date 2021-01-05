#!/bin/bash
#  getting user input and storing it in with array
# set -x
 declare -A config
 declare -A assigning_configs

mysql_vars=(port server-id datadir socket)
defining_configs()
{
	for var in ${!mysql_vars[@]}
	do
		read -p "Enter the  ${mysql_vars[$var]} : " value
		config+=([${mysql_vars[$var]}]="$value") 
		# echo ${config[$var]};
	done
}
defining_configs

for key in "${!config[@]}"
do
	if [ -n "${config[$key]}" ];then
		echo "$key ===> ${config[$key]}"
		assigning_configs+=(["$key"]=${config[$key]})
	else
		echo "$key has no values"
		unset config[$key]
	fi
done

set -x
echo "
	printing final configs
	${!assigning_configs[@]}'=='${assigning_configs[@]}
"

# echo ${config[@]}
sleep 10











# read -p "Enter the basedir : " basedir
# config+=([basedir]=$basedir) 


# echo ${config[@]};
# echo ${!config[@]}
# sleep 1

# read -p "enter the port for the same : " port

# config[port]="$port"
# config[server-id]="121"
# config[datadir]="/usr/local/mysql/slave_data"
# config[socket]="/tmp/mysql78.sock"

# for key in "${!config[@]}"
# do
# 	if [ -n "${config[$key]}" ];then
# 		echo "$key ===> ${config[$key]}"
# 	else
# 		echo "$key has no values"
# 		unset config[$key]
# 	fi
# done

# if [ ${config[@]+_} ];then
# 	echo "founded";
# else 
# 	echo "not founded";
# fi

set -x

echo "${!config[@]}"

sleep 10


# if [ -n "$string" ]
# then 
# 	echo "string has values"
# else
# 	echo "havent"
# fi















# dump codes
#OUTPUT=$(ls -1)
#echo "${OUTPUT}"

# disk_usage=$(du -sh )

# echo "${disk_usage}"

# if(${disk_usage} | awk{$0}> 3 )
# 	echo "success";
# 	echo "succeed";