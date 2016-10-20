#!/bin/bash
read name
if [ "$name" == "$USER" ]
then 
     who -u | grep "$name"
fi
