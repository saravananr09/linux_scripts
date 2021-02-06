#!/bin/bash
 dbs=("Mysql" "MariaDB" "Mongo" "msSQL")
# dbs=(Mysql MariaDB Mongo msSQL)

 set -x
values=(${dbs[*]})
# echo ${values[1]}
# sleep 5
indice=${#dbs[@]}


 awk -v arrval=${values[*]} -v indice=$indice 'BEGIN {
    indice[i++]=values
}
END {
for (i in indice)
{
sum=sum+sales[i];
print "ENVIRON[values]"
}
print "values"
}'





# echo $values | awk -v arrval=$values '{
# sales[i++]=$values;
# sum=10;
# }
# END{
# for (i in sales)
# {
# sum=sum+sales[i];
# print values[i]
# }
# print values
# }'


# echo | awk 'BEGIN {Customer["4587"] = "Neil Johnson";
# Customer["8953"] = "Ella binte Nazir";
# Customer["3455"] = "Bruce Hyslop";
# Customer["6335"] = "Isabella";
 
# }END { for (i in Customer)
# print  "The name of ", i, " is " ,Customer[i]
# }'


# echo | awk -v i=5 'BEGIN {
#     for (i=$i; i <= 5; i++) {
#         print i, " to the second power is ", i*i;
#     }
# exit;
# }'


# variable="line one\nline two"
# awk -v var="$values"  'BEGIN 
# {
#     print 
#     }'


