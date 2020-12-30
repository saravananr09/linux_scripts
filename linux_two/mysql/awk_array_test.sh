#!/bin/bash 
# MYSQL="/mnt/e/back/vicky/mysql_base/bin"
# USER="root"
# SOCKET="/tmp/mysql78.sock"
# mysql_con="$MYSQL/mysql -u $USER -S $SOCKET"


# has_priv=($($mysql_con -e "select * from mysql.user where user='sara'\G" |grep 'Y'|awk '{print $1}'|cut -d ':' -f1))


 


# echo ${has_priv[*]}
# 
#  ($(awk '!($0 in has_priv) { has_priv[$0]; print }'))

has_priv=("Select_priv" "Insert_priv" "Update_priv" "Delete_priv" "Grant_priv")
# has_priv=(Select_priv Insert_priv Update_priv Delete_priv Grant_priv)
set -x

awk -v privarr="length(${has_priv[@]})" '
    {
        print privarr
    }
'






# echo "${has_priv[@]}" | awk '{n=split($0, array, " ")} END{print n }'awk '{a[$1]++}  END { for ( n in a ) { i++; print n "=" a[n]} print i }'

# awk -v  privarr="${has_priv[@]}" '
#    {n=split($0, privarr, " ")} END{print $privarr[n] }'






# awk -F "'" 'BEGIN { n=split("'${has_priv[*]}'", arr); for (i=1;i<=n;++i) print arr[i] }'
# awk -F ":" '
# BEGIN {
#     print "====================================================="
#     printf "%-8s %-3s %-3s %-15s %-15s\n" , "User", "UID","GID","Home","SHELL" 
#     print "====================================================="

# }
# NR==1,NR==4 { printf "%-8s %-3d %-3d %-15s %-15s\n", $1,$3,$4,$6,$7 } ' ${has_priv[@]}





# $(printf '%s\n' "${has_priv[@]}" |  awk ' { awkArray[NR] = $1} END { for
# (i in awkArray) print awkArray[i], "\n"; }')

# ${has_priv[*]} << 'EOF'
# BEGIN {
#     print "start"
# }
# {
#     print "$0"
# }
# END{
#     print "hello"
# }
# EOF
# ($(awk $has_priv))



# awk -v vals="A=1:B=1:C=1:E=1:J=8:Q=10" '
#     BEGIN {
#         n = split(vals, v, ":")
#         for (i = 1; i <= n; ++i) {
#             split(v[i], a, "=")
#             arr[a[1]] = a[2]
#         }

#         print arr["J"]
#     }'


# awk -v keys="A:B:C:E:J:Q" -v vals="1:1:1:1:8:10" '
#     BEGIN {
#         nk = split(keys, k, ":")
#         nv = split(vals, v, ":")

#         if (nk != nv) exit 1

#         for (i = 1; i <= nk; ++i)
#             arr[k[i]] = v[i]

#         print arr["J"]
#     }
#     { 
#         print arr["Q"] 
#         # exit
#     }
#     '


