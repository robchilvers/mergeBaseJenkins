#!/bin/bash

while getopts ":p:" opt; do
  case $opt in
    p) jenkinsPort="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac
done

if [ -z "$jenkinsPort" ]
  then
    declare jenkinsPort='8081'
fi


echo "Starting MergeBase Jenkins SandBox"
echo " - Jenkins Port : " $jenkinsPort

cd docker/build
export JENKINS_PORT=$jenkinsPort

docker-compose up -d


unset JENKINS_HOME
rm -f docker-up.txt