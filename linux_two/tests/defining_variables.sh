#!/bin/bash
#  getting user input and storing it in with array
# set -x

 declare -A config
 declare -A assigning_configs
 declare -a mysql_vars
echo "***************************************************"
echo "Assigning variables for mysql"
echo "***************************************************"
# vars datadir socket
mysql_vars=(port server-id)
defining_configs(){
	read -p "Enter the $var  ${mysql_vars[$var]} : " value
	config+=([${mysql_vars[$var]}]="$value") 
	# echo ${config[$var]};
}


run_scr(){
    local var
	for var in ${!mysql_vars[@]}
	do
		defining_configs
	done

}

run_scr

for key in "${!config[@]}"
do
	if [ -n "${config[$key]}" ];then
		# echo "$key ===> ${config[$key]}"
		assigning_configs+=(["$key"]=${config[$key]})
	else
	# set -x
		echo "$key has no values" && second_run+=($key) 
		# unset mysql_vars[*]
		# sleep 1
		# echo "${mysql_vars[*]}"
        
		# mysql_vars+=($key)
		# defining_configs ${second_run[*]}
		unset config[$key]
        sleep 1
        echo "${config[@]}"
        sleep 1
	fi
    
done
    echo "following var need to re-assign ( ${second_run[*]} )"

# re-assign
re-defining_configs(){
    
	read -p "Enter the $var  ${mysql_vars[$var]} : " value
	config+=([${mysql_vars[$var]}]="$value") 
	# echo ${config[$var]};
}


exit
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




