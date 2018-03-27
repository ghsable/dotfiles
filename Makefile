# 変数代入


# 検証
all:
	@echo "HELLO WORLD!!"

# GitHubアカウント設定
gitconfig:
	git config --global user.name "ghsable"
	git config --global user.email sn.sable005@gmail.com
	git config --global core.editor "vim"
	### $git init 〜 $push の忘備録 ###
	# git init
	# git git remote add origin <URL>
	# git add --all
	# git commit -m "first commit"
	# git push -u origin master

# GitHubの$git add 〜 $git pushまで
gitacp:
	git add --all
	git commit -m "bugfix"
	git push -u origin master

# バックアップ
backup:
	@sh ~/dotfiles/bin/backup.sh

# デプロイ(macOS)
macdeploy:
	@sh ~/dotfiles/bin/lib/install_mac/install06_ln.sh
