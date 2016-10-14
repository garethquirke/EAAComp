#!/bin/bash

#read command to append data to the end of the file
#when run it will wait for you to type a string in
#it will append it to the end of the file(diary.txt)
# > will overwrite the file to 0 bytes and then transfer contents
#alternative to $ ( command ) is 'command'

read diarytext
echo $( date ) >> diary.txt
echo $diarytext >> diary.txt
