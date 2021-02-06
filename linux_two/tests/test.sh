#!/bin/bash
#  getting user input and storing it in with array
# set -x
# echo "************************MYSQL-starting @@ "$$" ***************************"
# # $(watch 'w') &
# $(sleep 333)
# trap ' ' 2
# jobs=$(jobs -l)
# echo $("$jobs"  )

# echo "***************************************************"
# echo "************************Script Ended***************************"
# exit

declare -A config
 declare -A collected_configs
 declare -a mysql_vars
mysql_vars=(port server-id)
set -x
# read_config(){

# 	# read 
# }
run_scr(){
	local var_name=($@)
	echo "${var_name[@]}"
	for i in ${!var_name[@]}
	do	
		echo "$i ... ${var_name[$i]}"
	done
}

run_scr ${mysql_vars[@]}



# defining_configs(){
# 	read -p "Enter the $var  ${mysql_vars[$var]} : " value
# 	config+=([${mysql_vars[$var]}]="$value") 
# }
# run_scr(){
#     local var;
# 	last_idx=0
# 	for var in ${!mysql_vars[@]}
# 	do
# 		defining_configs
#         for key in "${!config[@]}"
#         do
# 	    if [ -n "${config[$key]}" ];then
# 		    # echo "$key ===> ${config[$key]}"
# 			echo "assigning_configs ....  $key ==>  ${config[$key]} "
# 		    collected_configs+=(["$key"]=${config[$key]})
# 	    else
# 		    echo "$key has no values"
# 		    unset config[$key]
# 	    fi
# 		# ((last_idx=${#mysql_vars[@]} - 1))
#         done
# 	done

# }
# run_scr



exit

 
 
 declare -A config
 declare -A assigning_configs
 declare -a mysql_vars
echo "***************************************************"
echo "Assigning variables for mysql"
echo "***************************************************"
# vars datadir socket
mysql_vars=(port server-id)
# defining_configs(){
# 	read -p "Enter the $var  ${mysql_vars[$var]} : " value
# 	config+=([${mysql_vars[$var]}]="$value") 
# 	# echo ${config[$var]};
# }


# run_scr(){
# 	for var in ${!mysql_vars[@]}
# 	do
# 		defining_configs
# 	done

# }

# 

defining_configs () {
	if [[ "$#" -gt 0 ]]
	then
		echo "argu'ss"
		for argument in "$#"
		do
		read -p "Enter the $var  ${mysql_vars[$((argument - 1))]} : " value
		config+=([${mysql_vars[$var]}]="$value")
		done
	else
		echo "no -argus"
		read -p "Enter the $var  ${mysql_vars[$var]} : " value
		config+=([${mysql_vars[$var]}]="$value") 
	fi
	
	# echo ${config[$var]};
}
run_scr () {
	for var in ${!mysql_vars[@]}
	do
		defining_configs "${mysql_vars[$var]}"
	done

}
# 
# defining_configs
run_scr

for key in "${!config[@]}"
do
	if [ -n "${config[$key]}" ];then
		# echo "$key ===> ${config[$key]}"
		assigning_configs+=(["$key"]=${config[$key]})
	else
	# set -x
		echo "$key has no values"
		second_run+=($key)
		unset mysql_vars[*]
		sleep 1
		echo "${mysql_vars[*]}"
		mysql_vars+=($key)
		defining_configs ${second_run[*]}
		unset config[$key]
	fi
done

# re_assign(){

# }



# set -x
echo "***************************************************"
echo "Printing values from collected-variables"
echo "***************************************************"
# echo "printing final configs ${!assigning_configs[@]}'=='${assigning_configs[@]}"
for output in "${!assigning_configs[@]}"
do
	echo " $output=${assigning_configs[$output]}";
done 

exit 1	
echo "********************* END ******************************"
# echo ${config[@]}
sleep 1











# # echo " ${!mysql_vars[@]}    ...    ${#mysql_vars[@]}"
# i=0;
# for i in ${!mysql_vars[@]}
# do	
# 	echo "$i";
# 	let "i=i-1";
# 	echo "$i"
# 	# i=$(($i-1))
#     # echo "$i .... ${mysql_vars[$i]}"
# done


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
#
set -x

echo "${!config[@]}"

# sleep 10


# if [ -n "$string" ]
# then 
# 	echo "string has values"
# else
# 	echo "havent"
# fi




# run(){
	# if [[ "$#" > 0 ]]
	# then
	# 	echo "argu'ss"
	# else
	# 	echo "no -argus"
	# fi
# }
# run
# exit










# dump codes
#OUTPUT=$(ls -1)
#echo "${OUTPUT}"

# disk_usage=$(du -sh )

# echo "${disk_usage}"

# if(${disk_usage} | awk{$0}> 3 )
# 	echo "success";
# 	echo "succeed";