#!/bin/bash
 declare -A config
 declare -A assigning_configs
 declare -A re_assigning_configs
 declare -a mysql_vars
set -x
mysql_vars=(port server-id)

defining_configs(){
	read -p "Enter the $var  ${mysql_vars[$var]} : " value
	config+=([${mysql_vars[$var]}]="$value") 
}


# set -x
run_scr(){
    local var;
	for var in ${!mysql_vars[@]}
	do
		defining_configs
        for key in "${!config[@]}"
        do
	    if [ -n "${config[$key]}" ];then
		    # echo "$key ===> ${config[$key]}"
		    assigning_configs+=(["$key"]=${config[$key]})
	    else
		    echo "$key has no values"
		    unset config[$key]
	    fi
        done
	done

}

set -x
run_scr




echo "***************************************************"
echo "      Printing values from collected-variables     "
echo "***************************************************"
for output in "${!assigning_configs[@]}"
do
	echo " $output=${assigning_configs[$output]}";
done 	
echo "********************* END ******************************"
# echo ${config[@]}
exit 1




























# echo "***************************************************"
# echo "Assigning variables for mysql"
# echo "***************************************************"
# vars datadir socket
# 

# defining_configs () {
# 	if [[ "$#" -gt 0 ]]
# 	then
# 		echo "argu'ss"
# 		for argument in "$#"
# 		do
# 		read -p "Enter the $var  ${mysql_vars[$((argument - 1))]} : " value
# 		config+=([${mysql_vars[$var]}]="$value")
# 		done
# 	else
# 		echo "no -argus"
# 		read -p "Enter the $var  ${mysql_vars[$var]} : " value
# 		config+=([${mysql_vars[$var]}]="$value") 
# 	fi
	
# 	# echo ${config[$var]};
# }
# run_scr () {
# 	for var in ${!mysql_vars[@]}
# 	do
# 		defining_configs "${mysql_vars[$var]}"
# 	done

# }
# # 
# # defining_configs
# run_scr

# for key in "${!config[@]}"
# do
# 	if [ -n "${config[$key]}" ];then
# 		# echo "$key ===> ${config[$key]}"
# 		assigning_configs+=(["$key"]=${config[$key]})
# 	else
# 	# set -x
# 		echo "$key has no values"
# 		second_run+=($key)
# 		unset mysql_vars[*]
# 		sleep 1
# 		echo "${mysql_vars[*]}"
# 		mysql_vars+=($key)
# 		defining_configs ${second_run[*]}
# 		unset config[$key]
# 	fi
# done

# # re_assign(){

# # }



# # set -x
# echo "***************************************************"
# echo "Printing values from collected-variables"
# echo "***************************************************"
# # echo "printing final configs ${!assigning_configs[@]}'=='${assigning_configs[@]}"
# for output in "${!assigning_configs[@]}"
# do
# 	echo " $output=${assigning_configs[$output]}";
# done 

# exit 1	
# echo "********************* END ******************************"
# # echo ${config[@]}
# sleep 1




