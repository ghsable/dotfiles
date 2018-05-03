$(eval BIN_DIR := ~/dotfiles/bin)
$(eval MACOS_INSTALL_DIR := $(BIN_DIR)/install/macos)
$(eval ARCHLINUX_INSTALL_DIR := $(BIN_DIR)/install/archlinux)

# test
all:
	@sh $(BIN_DIR)/test.sh

# install.sh (macOS)
macos_install:
	@make macos_initialize
	@make macos_upgrade
	@make macos_deploy
	@make macos_list

# Initialize (macOS)
macos_initialize:
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

# install.sh (ArchLinux)
archlinux_install:
	@make archlinux_initialize
	@make archlinux_pacman
	@make archlinux_deploy
	@make archlinux_list

# Initialize (ArchLinux)
archlinux_initialize:
	@sh $(ARCHLINUX_INSTALL_DIR)/etc.sh

# Pacman (ArchLinux)
archlinux_pacman:
	@sh $(ARCHLINUX_INSTALL_DIR)/pacman.sh

# Deploy (ArchLinux)
archlinux_deploy:
	@sh $(ARCHLINUX_INSTALL_DIR)/ln.sh

# Display all system Information (ArchLinux)
archlinux_list:
	@sh $(ARCHLINUX_INSTALL_DIR)/eof.sh
