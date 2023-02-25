#!/bin/bash

while true
do
  # ekxoroi tin timi tou btc stin metavliti btc_price
  btc_price=$(curl -s -H 'Accept: application/json' 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=eur' | jq '.bitcoin.eur')
  
  # Elegxei an i timi tou Btc einai mikroteri tou 15000
  if (( $(echo "$btc_price > 15000" | bc -l) ))
  then
    # xrhsimopoiei to ntfy gia na steilei sto backend minima an isxuei i parapanw sinthiki
    ntfy -b telegram send "BTC price dropped below 15,000 euros"
  fi
  
  # perimenei 5 lepta kai meta ksana elegxei
  sleep 300
done
