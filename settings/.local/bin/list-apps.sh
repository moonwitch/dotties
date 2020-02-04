#!/bin/bash

for app in /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop;
do
  #app = "${app##/*/}";
  echo "${app:24:-8}";
done
