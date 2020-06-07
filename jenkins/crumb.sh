#!/bin/bash

crumb=$(curl -u "jenkins:1234" -s 'http://jenkins.ocp.abip:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
curl -u "jenkins:1234" -H "$crumb" -X POST http://jenkins.ocp.abip:8080/job/ENV/build?delay=0sec
curl -u "jenkins:1234" -H "$crumb" -X POST  http://jenkins.ocp.abip:8080/job/backup-to-aws-s3/buildWithParameters?MYSQL_HOST=db_host&DATABASE_NAME=testdb&AWS_BUCKET_NAME=abip-jenkins-mysql-backup
