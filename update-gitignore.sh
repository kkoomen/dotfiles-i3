#!/bin/bash


symlinks=$(find . -type l | sed -e s'/^\.\///g')
ignored_files=(`cat .gitignore`)

for link in $symlinks; do
  if [[ ! "${ignored_files[@]}" =~ "${link}" ]]; then
    echo "$link" >> .gitignore
  fi
done
