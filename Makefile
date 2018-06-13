$(eval BIN_DIR := ~/dotfiles/bin)
$(eval MACOS_INSTALL_DIR := $(BIN_DIR)/install_macos)
$(eval ARCHLINUX_INSTALL_DIR := $(BIN_DIR)/install_archlinux)

#################### all ####################
all:
	@sh $(BIN_DIR)/test.sh
#################### macOS(install) ####################
macos_install:
	@make macos_initialize
	@make macos_upgrade
	@make macos_deploy
	@make macos_list

macos_initialize:
	@sh $(MACOS_INSTALL_DIR)/etc.sh

macos_upgrade:
	@sh $(MACOS_INSTALL_DIR)/brew.sh
	@sh $(MACOS_INSTALL_DIR)/brewcask.sh
	@sh $(MACOS_INSTALL_DIR)/mas.sh

macos_deploy:
	@sh $(MACOS_INSTALL_DIR)/ln.sh

macos_list:
	@sh $(MACOS_INSTALL_DIR)/eof.sh
#################### Arch Linux(install) ####################
archlinux_install:
	@make archlinux_initialize
	@make archlinux_pacman
	@make archlinux_install_aur
	@make archlinux_deploy
	@make archlinux_list

archlinux_initialize:
	@sh $(ARCHLINUX_INSTALL_DIR)/etc.sh

archlinux_pacman:
	@sh $(ARCHLINUX_INSTALL_DIR)/pacman.sh

archlinux_install_aur:
	@sh $(ARCHLINUX_INSTALL_DIR)/aur.sh install

archlinux_deploy:
	@sh $(ARCHLINUX_INSTALL_DIR)/ln.sh

archlinux_list:
	@sh $(ARCHLINUX_INSTALL_DIR)/eof.sh
#################### Arch Linux(other) ####################
archlinux_update_aur:
	@sh $(ARCHLINUX_INSTALL_DIR)/aur.sh update

archlinux_upgrade:
	@sh $(BIN_DIR)/pacman.sh update
	@make archlinux_update_aur
#################### END ####################
