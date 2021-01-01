#  set -x
# A=( $( ls -1p ) )

# awk -v var="${A[@]}" 'BEGIN{split(var,list,"\n")}END{ for (i in list) print i}'
# temp=$IFS  
# IFS=$'|'
# A=( $( ls -1p ) )
A=("Mysql" "MariaDB" "Mongo" "msSQL" "Mysql" "MariaDB" "Mongo" "msSQL")

# IFS=$temp

awk -v var="${A[*]}" 'BEGIN{
    split(var,list," "); for (i=1;i<=length(list);i++) 

    printf ("\033[1;35m %s \n" ,list[i] ) 
    }'






# awk -v var="$A" 'BEGIN{split(var,list,"\n")}END{ for (i in list) print i}'
# awk -v var="$A[@]"' BEGIN{split(var,list,"\n")}END{ for (i in list) print i}'