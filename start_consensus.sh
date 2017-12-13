#!/usr/bin/expect -f
spawn dotnet neo-cli.dll /rpc
expect "neo>"
send "create wallet wallet.db3\n"
expect "password:"
send "$env(WALLET_PASS)\n"
expect "password:"
send "$env(WALLET_PASS)\n"
expect "neo>"
send "import key $env(CONSENSUS_KEY)\n"
expect "neo>"
send "list address\n"
send "start consensus\n"
expect "OnStart"
interact
