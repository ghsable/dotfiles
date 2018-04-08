## Variable
# bin
dir_a := ~/dotfiles/bin/
# lib (macOS)
dir_b := ~/dotfiles/lib/macos/install/
# lib (Arch Linux)
lib_c := ~/dotfiles/lib/archlinux/install/

# TEST
all:
	@sh $(dir_a)test.sh

# [GitHub] Set Account
gitconfig:
	@sh $(dir_a)github_config.sh

# [GitHub] git add ~ git push
gitacp:
	@sh $(dir_a)github_acp.sh

# Backup
backup:
	@sh $(dir_a)backup.sh

# Update (mac0S)
macosupgrade:
	make backup
	@sh $(dir_b)03_brew.sh
	@sh $(dir_b)04_brewcask.sh
	@sh $(dir_b)05_mas.sh

# Deploy (macOS)
macosdeploy:
	@sh $(dir_b)06_ln.sh
