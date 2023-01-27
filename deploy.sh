#!/bin/bash

echo ***************************
echo *******deploy**************
echo ***************************

VERSION=$1

ssh chandrasekharvemugadda@192.168.0.108 "/home/chandrasekharvemugadda/jenkins/publish $VERSION"
