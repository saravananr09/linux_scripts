#!/bin/bash
# Recipient="saravananr6332@gmail.com"
# Subject="Greeting"
# Message="Welcome to our site"
# `mail -s $Subject $Recipient <<< $Message`

# inner funciton testing

bar() {
    export B=something
    echo B=$B
    user='sara'
    frombar(){
        echo "$1 im the inside function who named frombar and i have values of bar too and it's $B"
    }
    frombar $user
}

bar
echo B=$B










