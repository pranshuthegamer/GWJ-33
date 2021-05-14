#!/bin/bash
# Github AutoShell
# Property itch.io/revdeluxe
# this copy is distributed to TLP discord Server
# Reason Godot Game jam
clear
echo "Updating Local Github Repository..................................."
echo "What do you want? Default,Input new repo..........................."
echo "Input 'yes' if default,'no' if Input..............................."
read defaultOrNot
clear
if [ $defaultOrNot == yes ]
then
  clear
  echo "Pulling"
  echo ""
  echo "git@github.com:pranshuthegamer/GWJ-33.git"
  echo ""
  sudo git pull origin master
else
  echo "Input the github link"
  read varRepo
  clear
  echo "using $varRepo"
  sudo git pull $varRepo
fi
echo "Are you SURE you want to add these?"
git status
echo "Please Confirm yes? or no?"
echo "Note that you need to change the 'git remote'"
echo "also check 'git config --list' if your on the right Repository"
read addCheck
clear
if [ $addCheck == yes ]
then
  echo "ADDING....................................."
  git add --all
elif [ $addCheck == no ]
then
  echo "CANCELLING................................."
  exit
fi
git status
if [ $addCheck == yes ]
then
  echo "Please Commit why is this to be Pushed?"
  read CommitInput
  git commit -m "$CommitInput"
else
  exit
fi
echo "Are you Ready to push these new files??(yes/no)"
echo "Note that this will be pushed to Origin-Master"
git status
read pushCheck
if [ $pushCheck == yes ]
then
  echo "PUSHING........................................"
  git push -u origin master
elif [ $pushCheck == no ]
then
  exit
fi
git status
