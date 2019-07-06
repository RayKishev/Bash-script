#!/bin/bash

# This script will generate the RANDOM number. 

PASSWORD="${RANDOM}"
echo "${PASSWORD}"


#Let's generate some longer paswwords

PASSWORD="$(date +%s%N)"
echo "${PASSWORD}"

# A better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# Appand a special character to the password. 
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"


