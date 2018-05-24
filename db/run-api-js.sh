#!/bin/bash

set -e

me=$(hostname)

node1=$(getent hosts node1 | awk '{ print $1 }')
node2=$(getent hosts node2 | awk '{ print $1 }')
node3=$(getent hosts node3 | awk '{ print $1 }')

if [ -z "$node1" ] ; then exit 1 ; fi;
if [ -z "$node2" ] ; then exit 1 ; fi;
if [ -z "$node3" ] ; then exit 1 ; fi;

sleep 5s

/mongo/mongodb-linux-x86_64-3.6.4/bin/mongo --host node1 < /mongo/topology

nodejs /mongo/api-js/src/start.js > /mongo/mem/$me.tester.log
