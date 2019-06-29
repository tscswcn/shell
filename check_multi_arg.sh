#!/bin/bash

if [[ $1 = 'tomcat' ]]; 
then
  echo "Input is tomcat"
elif [[ $1 = 'redis' ]] || [[ $1 = 'zookeeper' ]];
then
  echo "Input is $1"
else
  echo "Input Is Error."
fi
