#!/bin/bash
# Recipient="saravananr6332@gmail.com"
# Subject="Greeting"
# Message="Welcome to our site"
# `mail -s $Subject $Recipient <<< $Message`

# inner funciton testing

# bar() {
#     export B=something
#     echo B=$B
#     user='sara'
#     frombar(){
#         echo "$1 im the inside function who named frombar and i have values of bar too and it's $B"
#     }
#     frombar $user
# }

# bar
# echo B=$B



function outer1 {
    function inner1 {
       echo '*** Into inner function of outer1'
    }
    inner1;
    unset -f inner1
}

function outer2 {
    function inner2 {
       echo '*** Into inner function of outer2'
    }
    inner2;
    unset -f inner2
}
export PS1=':inner_vs_outer\$ '
export -f outer1 outer2

exec bash -i






