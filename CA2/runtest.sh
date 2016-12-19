#!/bin/bash

 # using awk to create the results columns with one tab spacing
 awk 'BEGIN { printf "CO \t N\tIdle\n" }' >> results.dat

 # iterate through 1 -> 50 represents users
 # while in a loop run the load test and pass in current number of users 
 for i in {1..50}
  do

 # echo the current position in the loop to track progress
  echo $i

 # each loadtest shall run for 10 seconds per user amount
 # & symbol informs the shell to run this command in the background
 # this allows me to collect utilization stats while the load test runs 
  timeout 10 ./loadtest $i &

 # write the CPU utilization to file rather than append it
 # this retrieves the set of results from mpstat based on the number of users currently running the load test
 # -P 0 indicates all stats for the first processor
 # 1 10 take a single count of the stats every second for a total of 10 seconds (matches the time interval) 
  mpstat -P 0 1 10 > cpuUI.txt

 # using awk to find the average idle time 
 # The pattern here is average and its preformed on the 12th column (where mpstat places this particular column)
  Idle=$(awk '/Average/ {print $12}' cpuUI.txt)

 # using awk to gather the number of completed jobs
 # this will find the total number of lines in the dat file
  CO=$(awk 'END{print NR}' synthetic.dat)


 # add the variables to the row and append it to the results file	      
  awk 'BEGIN { printf "'$CO' \t '$i'\t'$Idle'\n" }' >> results.dat

done
