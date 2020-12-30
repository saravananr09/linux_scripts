# printf '%s\n' A B C | paste -sd ',' >> file.csv
# df -h | sed 's/ */,/g' >file.csv
# df -h  >>file.csv
set -x
# ls -go * | sed 's/[ \t]/,/g' > file.csv
echo "no, privs, go" > file.csv

ls -go * | cut -f1| sed 's/[ \t]/,/g' >> file.csv