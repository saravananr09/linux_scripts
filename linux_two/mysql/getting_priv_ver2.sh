#!/bin/bash 
set -x
MYSQL="/mnt/e/back/vicky/mysql_base/bin"
USER="root"
SOCKET="/tmp/mysql78.sock"
mysql_con="$MYSQL/mysql -u $USER -S $SOCKET"
user_priv=1;
get_user() 
{
    read -p "Enter the user name " user;
    has_priv=($($mysql_con -e "select * from mysql.user where user='$user'\G" |grep 'Y'|awk '{print $1}'|cut -d ':' -f1))
    grant='Grant_priv'
    for priv_i in "${!has_priv[@]}"; do
        if [[ "${has_priv[$priv_i]}" == "${grant}" ]]
        then
            echo -e "$user is Privileged with \033[1;33m $grant\e[0m (Grant option) ";
            unset 'has_priv[$priv_i]'
            user_priv=1;
            # echo $user_priv;
        else
            user_priv=0;
            # echo $user_priv;
        fi
    done 
                # echo $user_priv;

    if [ $user_priv -eq 1 ];then
        printf "Also, $user has the following privileges \n"
        printf "\033[1;35m%s\e[0m \n" "${has_priv[@]}";
        # user_priv=1;
    else
        printf "$user \033[1;31mhave following privileges only and no grant option\e[0m \n"
        printf "\033[1;35m%s\e[0m \n" "${has_priv[@]}";
        # user_priv=0;
    fi
} 

while true; do
    get_user
    # sleep 4
done


    


