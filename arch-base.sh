#!/bin/bash

# Arch Base install
echo LANG=de_DE.UTF-8 > /etc/locale.conf
echo KEYMAP=de-latin1-nodeadkeys > /etc/vconsole.conf
ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

hwclock --systohc

echo "botnet" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 botnet.localdomain botnet" >> /etc/hosts

echo root:passwd | chpasswd

pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pulseaudio pavucontrol bash-completion openssh rsync acpi acpi_call tlp virt-manager edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font terminator git

pacman -S --noconfirm nvidia nvidia-utils nvidia-settings xf86-video-intel

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m niklas
echo niklas:passwd | chpasswd
usermod -aG libvirt niklas

echo "niklas ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/niklas

printf "\e[1;32mEdit the /etc/locale.gen, exit and reboot\e[0m"
