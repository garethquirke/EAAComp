#!/bin/bash

# scan a directory and count the number of files found
# ./count_files /Documents

ls $1 |wc -l 
