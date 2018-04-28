$(eval BIN_DIR := ~/dotfiles/bin)
$(eval MACOS_INSTALL_DIR := $(BIN_DIR)/install/macos)

# test
all:
	@sh $(BIN_DIR)/test.sh

# install.sh (ArchLinux)
archlinux_install:
	@echo hello world

# install.sh (macOS)
macos_install:
	@make macos_initialize
	@make macos_upgrade
	@make macos_deploy
	@make macos_list

# Initialize (macOS)
macos_initialize:
	@sh $(MACOS_INSTALL_DIR)/defaults.sh
	@sh $(MACOS_INSTALL_DIR)/etc.sh

# Upgrade (mac0S)
macos_upgrade:
	@sh $(MACOS_INSTALL_DIR)/brew.sh
	@sh $(MACOS_INSTALL_DIR)/brewcask.sh
	@sh $(MACOS_INSTALL_DIR)/mas.sh

# Deploy (macOS)
macos_deploy:
	@sh $(MACOS_INSTALL_DIR)/ln.sh

# Display Installed list (macOS)
macos_list:
	@sh $(MACOS_INSTALL_DIR)/eof.sh
