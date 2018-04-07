# 変数代入


# TEST
all:
	@echo "HELLO WORLD!!"

# [GitHub] Set Account
gitconfig:
	git config --global user.name "ghsable"
	git config --global user.email sn.sable005@gmail.com
	git config --global core.editor "vim"
	### git init ~ git push ###
	# git init
	# git git remote add origin <URL>
	# git add --all
	# git commit -m "first commit"
	# git push -u origin master

# [GitHub] git add ~ git push
gitacp:
	git add --all
	git commit -m "bugfix"
	git push -u origin master

# Backup
backup:
	@sh ~/dotfiles/bin/backup.sh

# Deploy (macOS)
macdeploy:
	@sh ~/dotfiles/lib/macos/install/06_ln.sh
