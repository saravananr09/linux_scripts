BEGIN {
    FS=":"
}
{user_shells[$7] +=1}
END {
    for (shell in user_shells)
        print shell, user_shells[shell]
}