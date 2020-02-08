#!/usr/bin/expect -f
spawn sudo ./unload.sh
send "my-secret-password\n"
spawn sudo ./load.sh
send "my-secret-password\n"
