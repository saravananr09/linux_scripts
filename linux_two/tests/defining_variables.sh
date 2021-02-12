#!/bin/bash
#  getting user input and storing it in with array
#  set -x

 declare -A config
 declare -A assigning_configs
 declare -a mysql_vars
 declare -a unassigned_mysql_vars

echo "***************************************************"
echo "Assigning variables for mysql"
echo "***************************************************"
# vars datadir socket  /// (( i=0; i<="${#split_var[@]}"; i++))
mysql_vars=(port server-id)
defining_configs(){
	declare -a split_var
	split_var=($@)
	echo "from split_var :: ${split_var[@]}"
	for enter in ${!split_var[@]}
	do
	read -p "Enter($enter) the $var_name  ${split_var[$var_name]} : " value
	config+=([${split_var[$var_name]}]="$value") 
	done
	# echo ${config[$var]};
}


run_scr(){
    local var_name
	for var_name in ${!mysql_vars[@]}
	do
		defining_configs ${mysql_vars[@]}
	done
	for key in "${!config[@]}"
	do
	if [ -n "${config[$key]}" ];then
		# echo "$key ===> ${config[$key]}"
		assigning_configs+=(["$key"]=${config[$key]})
	else
	# set -x
		echo "$key has no values"  
		unset config[$key]
		unassigned_mysql_vars+=($key)
	    sleep 1
        # echo "${config[@]}"
	fi    
	done
}
    #  echo "following var need to re-assign ( ${second_run[*]} )"

run_scr

printf "\n"
# re-assign
#  set -x
if [[ "${#unassigned_mysql_vars[@]}" -gt "${#_mysql_vars[@]}" ]]
then 
	echo -e "need to re-assign ! \n"
	echo "inside if of ${unassigned_mysql_vars[@]}"
	sleep 1
	defining_configs ${unassigned_mysql_vars[@]}
else	
	echo -e "Vars has assigned ! \n "
fi



# set -x
echo "***************************************************"
echo "Printing values from collected-variables"
echo "***************************************************"
# echo "printing final configs ${!assigning_configs[@]}'=='${assigning_configs[@]}"
for output in "${!assigning_configs[@]}"
do
	echo " $output=${assigning_configs[$output]}";
done 

# exit 1	
echo "********************* END ******************************"
# echo ${config[@]}
sleep 1





