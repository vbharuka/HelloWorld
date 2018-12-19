#!/bin/bash

# https://gist.github.com/robwierzbowski/5430952/
# Create and push to a new github repo from the command line.  
# Grabs sensible defaults from the containing folder and `.gitconfig`.  
# Refinements welcome.

# Gather constant vars
CURRENTDIR=${PWD##*/}
GITHUBUSER=$(git config github.user)

# Get user input
REPONAME='HelloWorld'
USER='vbharuka'
DESCRIPTION='HelloWorld'
echo "Here we go..."

# Curl some json to the github API oh damn we so fancy
curl -u ${USER:-${GITHUBUSER}} https://api.github.com/user/repos -d "{\"name\": \"${REPONAME:-${CURRENTDIR}}\", \"description\": \"${DESCRIPTION}\", \"private\": false, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"

# Set the freshly created repo to the origin and push
# You'll need to have added your public key to your github account
git remote set-url origin git@github.com:${USER:-${GITHUBUSER}}/${REPONAME:-${CURRENTDIR}}.git
git push --set-upstream origin master