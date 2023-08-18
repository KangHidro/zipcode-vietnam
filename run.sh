#!/bin/bash

for i in 90 78 26 23 97 16 86 55 75 67 77 98 94 21 50 63-64 65 32 76 81 64-62 20 18 10-14 45-46 03 04-05 95 70-74 36 17 57 91-92 60 30 66 25 31 82-83 07 43-44 08 59 35 56 47 51-52 53-54 01-02 48 96 34 80 06 24 40-42 49 84 87 22 85 15 33; do
# for i in 90 78; do
newman run zipcode-col.json --environment zipcode-env.json --delay-request 200 --timeout-request 5000 --insecure --suppress-exit-code --export-environment zipcode-env.json --env-var "searchCode="$i
tmp=$(jq .values zipcode-env.json | jq -c '.[] | select(.key | contains("zipData"))' | jq .value)
jq '. | fromjson' <<< $tmp > "provinces/"$i".json"
done