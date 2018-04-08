#!/bin/sh

# create -> "~/.gitconfig"
git config --global user.name "ghsable"
git config --global user.email sn.sable005@gmail.com
git config --global core.editor "vim"
echo "created -> \"~/.gitconfig\""

# Display "first commit" procedure
echo "### git init ~ git push ###"
echo "# git init"
echo "# git git remote add origin <URL>"
echo "# git add --all"
echo "# git commit -m \"first commit\""
echo "# git push -u origin master"
