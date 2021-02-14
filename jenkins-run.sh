#!/bin/bash

while getopts ":h:p:" opt; do
  case $opt in
    h) jenkinsHome="$OPTARG"
    ;;
    p) jenkinsPort="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit -1
    ;;
  esac
done

if [ -z "$jenkinsHome" ]
  then
    declare jenkinsHome=$(pwd)/jenkinsHome/default
fi
if [ -z "$jenkinsPort" ]
  then
    declare jenkinsPort='8081'
fi


echo "Starting MergeBase Jenkins SandBox"
echo " - Jenkins Home : " $jenkinsHome
echo " - Jenkins Port : " $jenkinsPort

cd docker
export JENKINS_HOME=$jenkinsHome
export JENKINS_PORT=$jenkinsPort

docker-compose up -d

pwd=`docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword`
echo "Jenkins Admin Password  : " $pwd


unset JENKINS_HOME
unset JENKINS_PORT
rm -f docker-up.txt