#!/bin/bash

semanticversionfile=`cat semanticversion.txt`
adjustedversion="${semanticversionfile#*=}"
semanticversion="${adjustedversion%VERSION=*}"

echo "Version from download: $semanticversion"
echo "SEMANTIC_VERSION=$semanticversion" >> $GITHUB_ENV