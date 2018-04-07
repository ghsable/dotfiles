#!/bin/sh
  
# Start Message
echo "backup now ..."

# IF [ MacOS | ArchLinux ]
if [ "${TERM_PROGRAM}" = "Apple_Terminal" ] ; then
   ### macOS ###
   # Variable
   dir_a=~/dotfiles/lib/macos/list/       # BackupFile Directory
   dir_b=~/dotfiles/lib/macos/install/    # lib(install.sh) Directory

   # Start Backup
   ls ${dir_b}    > ${dir_a}install.txt   # lib(install.sh)
   brew list      > ${dir_a}brew.txt      # brew list
   brew cask list > ${dir_a}brewcask.txt  # brew cask list
   mas list       > ${dir_a}mas.txt       # mas list

   # End Message
   echo "#################### >> [macOS] Complete!! ${0} . Thanks :D"
elif [ "${XXX}" = "" ] ; then
   ### Arch Linux ### 
          
   # End Message
   echo "#################### >> [ArchLinux] Complete!! ${0} . Thanks :D"
else     
   ### ERROR ### 

   # End Message
   echo "#################### >> ELLOR!! Sorry :("
fi 
