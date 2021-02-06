#!/bin/bash
# set -e
# trap die ERR

# die()
# {
#   echo "Failed in script \"$0\" at line $BASH_LINENO"
#   exit 1
# }


spin()
{
#   spinner="/|\\-/|\\-"
  spinner=".|.|."
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i}"
      echo -en "\010"
      sleep 1
    done
  done
}

echo "About to make a slow web call..."

# Start the Spinner:
spin &
# Make a note of its Process ID (PID):
SPIN_PID=$!
echo "$!"
# Kill the spinner on any signal, including our own exit.
trap "kill -9 $SPIN_PID" `seq 0 15`


 declare -A config
 declare -A assigning_configs
 declare -A re_assigning_configs
 declare -a mysql_vars
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

# set -x
run_scr




echo "***************************************************"
echo "      Printing values from collected-variables     "
echo "***************************************************"
for output in "${!assigning_configs[@]}"
do
	echo " $output=${assigning_configs[$output]}";
done 	
echo "********************* END ******************************"


# function f() {
#     # set -x
#     a=("$@")
#     ((last_idx=${#a[@]} - 1))
#     b=${a[last_idx]}
#     unset a[last_idx]

#     for i in "${a[@]}" ; do
#         echo "$ii"
#     done
#     echo "b: $b"
# }

# x=("one two" "LAST")
# b='even more'

# f "${x[@]}" "$b"
# echo ===============
# f "${x[*]}" "$b"

exit 0
# set -x
# kill -9 $SPIN_PID

