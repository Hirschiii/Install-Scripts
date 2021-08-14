#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

reflector --country Germany --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

sudo pacman -S xorg lightdm firefox i3 i3-gaps picom rofi dmenu vlc libreoffice lightdm-gtk-greeter 

sudo auto-cpufreq --install

sudo systemctl enable lightdm

echo "Denk an Auto-CpuFreq"
