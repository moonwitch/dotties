#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

echo ""
echo "Stowing apps for user: ${whoami}"

for item in ${base[@]}; do
    stowit "${HOME}" $app
done

echo ""
echo "##### ALL DONE"
