#!/bin/bash

./fresh_env.sh

echo ""
echo "********************************"
echo "ADDRESS BOOK CONTRACT DEPLOYMENT"
echo "********************************"
echo ""

echo "Navigate to your contracts directory"
cd ./contracts/addressbook

echo "Compile the Address Book Contract"
cdt-cpp addressbook.cpp -o addressbook.wasm

echo "Create a new key for the addressbook contract"
cleos wallet create_key

# Get the first non-eosio key (second key in the list)
PUBKEY=$(cleos wallet keys | grep EOS | head -1 | tr -d ' "[],' )
echo "🔑 Using public key: $PUBKEY"

echo "Create account for the addressbook contract"
cleos create account eosio addressbook $PUBKEY -p eosio@active
cleos create account eosio alice $PUBKEY -p eosio@active

echo "Deploy the Address Book Contract"
cleos set contract addressbook . addressbook.wasm addressbook.abi -p addressbook

echo "✅ Address Book contract deployed! You can now interact with it using cleos."

echo "Example: Adding an entry to the address book for Alice"
cleos push action addressbook upsert '["alice", "alice", "liddell", "123 drink me way", "wonderland", "amsterdam"]' -p alice@active

echo "Check that Alice cannot insert an entry for Bob"
cleos push action addressbook upsert '["bob", "bob", "is a loser", "doesnt exist", "somewhere", "someplace"]' -p alice@active

echo "Retrieve Alice's entry from the address book"
cleos get table addressbook addressbook people --lower alice --limit 1

echo "Check that Alice can delete her entry"
cleos push action addressbook erase '["alice"]' -p alice@active

echo "Check that Alice's record is deleted"
cleos get table addressbook addressbook people --lower alice --limit 1

