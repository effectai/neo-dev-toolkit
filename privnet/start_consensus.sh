#!/usr/bin/expect -f
spawn dotnet neo-cli.dll /rpc
expect "neo>"
send "open wallet wallet.db3\n"
expect "password:"
send "$env(PASS)\n"
expect "neo>"
send "list key\n"
send "start consensus\n"
expect "OnStart"
interact
