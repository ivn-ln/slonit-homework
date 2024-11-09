#!/bin/bash

a=$(ip a | grep -P "inet.*global dynamic")
echo Active ipv4 interface: $a
mkfifo pipe
ss -plnt > pipe &
cat pipe > sockets.txt
rm pipe
echo File written
cat << EOF > file.txt
Lorem
ipsum
EOF
