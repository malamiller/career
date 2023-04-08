#!/bin/bash

#copy all file into app directory
rm -r /var/www/html/*

cp -r /var/lib/jenkins/workspace/deploy1/. /var/www/html/