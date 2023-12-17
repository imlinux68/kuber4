#!/bin/bash

function createDeployment() {
	read -p "Enter a name of your deployment: " deployName
	read -p "Enter an image name to create deployment with it: " imageName
	read -p "Enter a filename output: " filename
	if [[ -z $deployName || -z $imageName || -z $filename ]] 
		then 
			echo "Name canot be empty! try again!"
		else
			kubectl create deployment $deployName --image=$imageName --dry-run=client -o yaml | tee ${filename}.yaml
	fi

}
createDeployment
