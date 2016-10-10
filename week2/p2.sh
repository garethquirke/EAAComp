#!/bin/bash

echo "This is a script to create directories"

# delete the directory first
rmdir testFOLDER

# throws an exception if testFOLDER already exists
mkdir testFOLDER

# create 3 subdirs in week2
cd testFOLDER
mkdir subdir1 subdir2 subdir3

