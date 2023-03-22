#!/bin/bash

TARGET_ID=$(aws deploy list-deployment-targets --deployment-id $DEPLOYMENT_ID  --region us-east-2  | jq .targetIds | sed 's/\"//g'| sed 's/\[//g' | sed 's/\]//g')

aws deploy batch-get-deployment-targets --deployment-id $DEPLOYMENT_ID --region us-east-2  --target-ids TARGET_ID | grep -i scriptfailed 

if [ echo $? -ne 0 ]; then

echo "codedeploy failed"

fi