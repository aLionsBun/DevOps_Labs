#!/bin/bash

RED='\033[0;31m' # Red color code
GREEN='\033[0;32m' # Green color code
NC='\033[0;m' # No color code

env > temp.txt

while IFS= read -r -d $'\n' line; do
    if [[ "$line" == *"="* ]]; then
        name=${line%%=*} # Get name of variable
        value=${line#*=} # Get value of variable
        printf "${RED}${name}${NC}=${GREEN}${value}${NC}\n" # Formatted output
    else
        printf "${GREEN}${line}${NC}\n" # Assume that string without = is part of value
    fi
done < "temp.txt"