#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# Set /etc/*
for shfile in $(ls ./etc/*.sh)
do
  sh ${shfile}
done

# End Message
cat ./complete.txt
