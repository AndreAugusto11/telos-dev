#!/bin/bash

./fresh_env.sh

echo "Navigate to your contracts directory"
cd ./contracts/eosio.token

echo "Create Account for Contract"
cleos create account eosio eosio.token EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV

echo "Compile the Token Contract"
eosio-cpp -I include -o eosio.token.wasm src/eosio.token.cpp --abigen

echo "Deploy the Token Contract"
cleos set contract eosio.token . --abi eosio.token.abi -p eosio.token@active

echo "Create a new token with the symbol 'SYS' and a maximum supply of 1,000,000.0000 SYS"
cleos push action eosio.token create '[ "eosio", "1000000.0000 SYS"]' -p eosio.token@active

echo "Issue 1000.0000 SYS to the 'eosio' account"
cleos push action eosio.token issue '[ "eosio", "100.0000 SYS", "memo" ]' -p eosio@active

echo "✅ Token contract deployed and tokens issued! You can now interact with the token contract using cleos."

echo "🎉 All contracts deployed! You can now interact with them using cleos."

echo "Create a new key for Bob"
cleos wallet create_key

# Get the first non-eosio key (second key in the list)
PUBKEY=$(cleos wallet keys | grep EOS | head -1 | tr -d ' "[],' )
echo "🔑 Using public key: $PUBKEY"

echo "Create account for Bob"
cleos create account eosio bob $PUBKEY -p eosio@active

echo "Transfer 25.0000 SYS from eosio to bob"
cleos push action eosio.token transfer '[ "eosio", "bob", "25.0000 SYS", "m" ]' -p eosio@active

BALANCE_BOB=$(cleos get currency balance eosio.token bob SYS)
BALANCE_EOSIO=$(cleos get currency balance eosio.token eosio SYS)

if [ "$BALANCE_BOB" == "25.0000 SYS" ]; then
  echo "✅ Bob's balance is correct: $BALANCE_BOB"
else
  echo "❌ Bob's balance is incorrect: $BALANCE_BOB"
fi

if [ "$BALANCE_EOSIO" == "75.0000 SYS" ]; then
  echo "✅ eosio's balance is correct: $BALANCE_EOSIO"
else
  echo "❌ eosio's balance is incorrect: $BALANCE_EOSIO"
fi

cd ../..