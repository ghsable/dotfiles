#!/bin/sh

## Variable
# ".??*" Directory
dir_a=~/dotfiles/etc/macos/
# "other than .??*" ListFile
file_a=~/dotfiles/lib/macos/list/ln.txt

# cd ".??*" Directory
cd ${dir_a}

for f in .??*
do
  # continue this ".??*"
  [ "${f}" = ".DS_Store" ] && continue
  # ln ".??*" ${HOME}
  ln -snfv ${dir_a}${f} ~/${f}
done

# ln "othe than .??*" ${HOME}
grep -v -e '^$' -e '^#' ${file_a} | while read -r line
do
  ln -snfv ~/${line} ~/
done

# End Message
cat ~/dotfiles/lib/macos/list/endmessage.txt
