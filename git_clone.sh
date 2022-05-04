#!/bin/bash

# Create git-contributions directory at home where all repositories would be cloned.
if [ ! -d "$HOME"/git-contributions ]; then
    mkdir "$HOME"/git-contributions
fi

cd "$HOME"/git-contributions || { printf "cd failed, exiting\n" >&2;  return 1; }

# Clone repository using HTTPS web url
printf "git HTTPS web url: "
read -r gitcontributions
git clone "$gitcontributions"
echo $gitcontributions

# Extract reponame 
reponame="$(echo $gitcontributions | sed -r 's/.+\/([^.]+)(\.git)?/\1/')"
echo "Repsoitory Name: $reponame"
cd ~/git-contributions/$reponame

# Create a new branch in cloned repository
echo "Do you want to create a new branch?(y/n)"
read -r ans
if [ $ans == "Y" ] || [ $ans == "Yes" ] || [ $ans == "y" ] || [ $ans == "yes" ]; then
    printf "Enter new branch name: "
    read -r branch_name
    git checkout -b "$branch_name"
    echo "happy coding"
elif [ $ans == "N" ] || [ $ans == "No" ] || [ $ans == "n" ] || [ $ans == "no" ]; then
    echo "At master branch only"
fi

echo "run cd ~/git-contributions/$reponame and start contributing !!!"
unset ans
unset gitcontributions

