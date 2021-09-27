#!/bin/bash

tempVersion=$(jq '.version' ../API/appsettings.json)
docVersion="${tempVersion%\"}"
docVersion="${docVersion#\"}"
echo "DocVersion: $docVersion"

IFS='.' read -ra versionArray <<< "$docVersion" # docVersion is read into an array as tokens separated by IFS

versionMajor="${versionArray[0]}"
echo "MajorVersion: $versionMajor"

versionMinor="${versionArray[1]}"
echo "MinorVersion: $versionMinor"

versionHotfix="${versionArray[2]}"
echo "HotfixVersion: $versionHotfix"

IFS=' ' # reset to default value after usage

versionBase="$versionMajor.$versionMinor.$versionHotfix"
echo "BaseVersion: $versionBase"

buildNumber='${bamboo.buildNumber}' #'1'
echo "BuildNumber: $buildNumber"

branchSha='${bamboo.repository.revision.number}'

branchHash=${branchSha:0:8} #git rev-parse --short $branchSha
echo "BranchHash: $branchHash"

branchName='${bamboo.planRepository.branchName}' #'develop'
echo "BranchName: $branchName"

semanticVersion=1.0.0
qualifiedVersion=$versionBase

# branch is the root develop branch
if [[ $branchName == *"develop"* ]]; then
echo "Develop Branch Flow"
semanticVersion=$versionBase-develop.$buildNumber
elif [[ $branchName == *"release"* ]]; then
echo "Release Branch Flow"
semanticVersion=$versionBase
qualifiedVersion=$versionMajor.$versionMinor.$buildNumber
elif [[ $branchName == *"hotfix"* ]]; then
echo "Hotfix/Release Branch Flow"
semanticVersion=$versionBase-hotfix.$buildNumber
else
echo "Feature Branch Flow"
semanticVersion=$versionBase-$branchHash.$buildNumber
fi

echo -e "SEMANTIC_VERSION=$semanticVersion\nVERSION=$qualifiedVersion\n" > ./semanticversion.txt
echo "$(cat ./semanticversion.txt)"
echo $(jq ".version=\"$semanticVersion\"" appsettings.json) > ./appsettings.json
echo "$(cat ./appsettings.json)"
