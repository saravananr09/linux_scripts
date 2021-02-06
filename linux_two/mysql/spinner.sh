#!/bin/bash
# spin() {
#     sp='/-\|'
#     printf ' '
#     while true; do
#         printf '\b%.1s' "$sp"
#         sp=${sp#?}${sp%???}
#         sleep 0.05
#     done
# }

# progressbar()
# {
#     bar="##################################################"
#     barlength=${#bar}
#     n=$(($1*barlength/100))
#     printf "\r[%-${barlength}s (%d%%)] " "${bar:0:n}" "$1" 
# }

# spin &
# pid=$!

# #your task here

# for i in `seq 1 100`;
# do
#     progressbar $i
#     sleep 0.1
# done

# # kill the spinner task
# kill $pid > /dev/null 2>&1



echo -ne '>>>                       [20%]\r'
echo "saravanan"
sleep 2
echo -ne '>>>>>>>                   [40%]\r'
echo "Asaraa sara"
sleep 2
echo -ne '>>>>>>>>>>>>>>            [60%]\r'
# some task
sleep 2
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>   [80%]\r'
# some task
sleep 2
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\r'
echo -ne '\n'








echo -ne '>>>>>>>                     (33%)\r'
sleep 1
echo -ne '>>>>>>>>>>>>>>             (66%)\r'
sleep 1
echo -ne '>>>>>>>>>>>>>>>>>>>>>>>>>>>>   (100%)\r'
echo -ne '\n'