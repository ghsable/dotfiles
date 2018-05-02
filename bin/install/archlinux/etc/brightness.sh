#!/bin/bash

echo "${0} ..."

# [ACPI] Set Backlight
echo 'Update -> /sys/class/backlight/acpi_video0/brightness'
sudo tee /sys/class/backlight/acpi_video0/brightness<<< 3
