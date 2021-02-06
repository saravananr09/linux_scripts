#!/bin/bash
# awk -F ":" '
# BEGIN {
#     print "====================================================="
#     printf "%-8s %-3s %-3s %-15s %-15s\n" , "User", "UID","GID","Home","SHELL" 
#     print "====================================================="

# }
# NR==1,NR==4 { printf "%-8s %-3d %-3d %-15s %-15s\n", $1,$3,$4,$6,$7 } ' /etc/passwd 


dbs=("Mysql" "MariaDB" "Mongo" "msSQL")

# set -x
# echo ${dbs[*]}
# echo ${#dbs[*]}
# echo ${!dbs[*]}
# echo ${dbs[*]}

for i in ${!dbs[@]}
do 
    echo "index $i and its values is ${dbs[$i]}"
done





# echo "${dbs[*]}"|awk -F ":" '
# BEGIN {
#     dbsa[]
#     print "====================================================="
#     printf "%-8s %-3s %-3s %-15s %-15s\n" , "User", "UID","GID","Home","SHELL" 
#     print "====================================================="

# }
# NR==1,NR==4 { printf "%-8s \n", $1 } ' 





# echo ${dbs[@]/*[aA]*/}
# echo ${#dbs[*]}




