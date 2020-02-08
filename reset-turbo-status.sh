#!/usr/bin/expect -f

set pw "$env(LOGIN_PASSWORD)"

spawn sudo ./unload.sh
sleep 3
expect "Password:"
send "$pw\r"
interact

spawn sudo ./load.sh
sleep 3
expect "Password:"
send "$pw\r"

interact
