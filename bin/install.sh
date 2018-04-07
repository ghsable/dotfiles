#!/bin/sh

# Start Message
echo "install now ..."

# IF [ MacOS | ArchLinux ]
if [ "${TERM_PROGRAM}" = "Apple_Terminal" ] ; then
   ### macOS ###
   # Variable
   #lib(install.sh) ListFile
   file_a=~/dotfiles/lib/macos/list/install.txt
   #lib(install.sh) Directory
   dir_a=~/dotfiles/lib/macos/install/

   # sh install.sh
   grep -v -e '^$' -e '^#' ${file_a} | while read -r line
   do
     echo "${line} ..."
     sh ${dir_a}${line}
   done

   # End Message
   echo "#################### >> [macOS] Complete!! ${0} . Thanks :D"
elif [ "${XXX}" = "" ] ; then
   ### Arch Linux ###

   # End Message
   echo "#################### >> [ArchLinux] Complete!! ${0} . Thanks :D"
else
   ## ERROR ###

   # End Message
   echo "#################### >> ELLOR!! Sorry :("
fi
