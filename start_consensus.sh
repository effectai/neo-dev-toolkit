#!/usr/bin/expect -f
spawn dotnet neo-cli.dll /rpc
send "open wallet $env(WALLET_FILE)\n"
expect "password:"
send "$env(WALLET_PASS)\n"
expect "neo>"
send "start consensus\n"
expect "OnStart"
interact
