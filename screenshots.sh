#!/bin/bash

# A script to copy your screenshots to a subfolder for all you mac users.
# Created by Nathaniel Young
# @nyoungstudios on GitHub
# Version: 05/26/2020

IFS=$'\n'
directory="/Users/$(printenv USER)/Desktop"
files=$(ls "$directory" | grep "Screen Shot" | grep .png)

# for silent mode
printFlag=1

if [ "$1" == "-s" ]
then
  printFlag=0
fi

subfolderName="screenshots"

# creates subfolder if it doesn't already exist
if [ ! -d "$directory/$subfolderName" ]
then
  if [ $printFlag -eq 1 ]
  then
    echo "Created subfolder in \"$directory\" called: \"$subfolderName\""
  fi
  mkdir "$directory/$subfolderName"
fi

# moves files into subfolder
for f in $files
do
  if [ $printFlag -eq 1 ]
  then
    echo "Moved file: $f"
  fi
  mv "$directory/$f" "$directory/$subfolderName"
done

