#!/bin/bash

ip=$(route | grep -P "^default" | grep -Po "[^ ]*$")
echo Active ipv4 interface: $ip
mkfifo pipe
ss -plnt > pipe &
cat pipe > sockets.txt
rm pipe
echo File sockets.txt written
mkfifo log
sudo cat /var/log/boot.log > log &
cat log | gzip -f > log.gz 
rm log
echo Logs archived in log.gz
mkfifo format
echo %d/%m 20%y > format &
echo %d/%m 20%y | (read f; echo Current date: $(date +"$f");)
rm format
cat << EOF > file.txt
Lorem
ipsum
EOF
echo File file.txt written
