#!/bin/bash

#run the command and then comment on what it achieves in life

# ps gives you the process status
# -ef gives every process on the system
# and now we pipe this to grep to search for mysql processes
# This is useful to check if the process is running or not

ps -ef | grep mysql

