# Install-Scripts
My scripts, to easy install my base 
This README file is just for me to remember the installation 

Change what you need spacely the name and passwd for root and you.

---

## Arch Base install will do:

What you have to do first:

1. Partition the Disk (in my case with fdisk)
> fdisk /dev/...
> g 
> Partition One: +256M t 1
> Partition Two: root 
2. Make the filesystems
> mkfs.vfat /dev/...1
> mkfs.ext4 /dev/...2
3. Mount the Partitions
> mount /dev/...2 /mnt
> mkdir -p /mnt/boot/efi
> mount /dev/...1 /mnt/boot/efi
4. Then do the really base install
> pacstrap /mnt base linux linux-firmware git vim intel-ucode
5. Generate FSTAB
> genfstab -U /mnt >> /mnt/etc/fstab
6. ChRoot
> arch-chroot /mnt
7. OPTIONAL: Swapfile
8. Run the install script:

### This is everething the base install script will do:
---
- Set everything to german
- set the time
- set the host/-name
- the root-passwd
- install everything i need 
> efibootmgr networkmanager network-manager-applet dialog wpa_supplicant reflector base-devel linux-headers xdg-user-dirs xdg-utils nfs-utils inetutils bluez bluez-utils cups alsa-utils pulseaudio pavucontrol openssh rsync acpi acpi_call tlp virt-manager bridge-utils openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware acpid os-prober kitty git
- install my drivers 
> nvidia nvidia-utils nvidia-settings xf86-video-intel
- install grub
- enable everything
- and add my user and waht I need (set passwd, edit visudo, ...)
---

# The i3 setup script:

Just run the script. It will do:

- get latest pacman mirrors
- setup firewalld
- install some things (:
> xorg lightdm firefox i3 i3-gaps picom rofi dmenu vlc libreoffice lightdm-gtk-greeter 
- and finish.

After thet I install yay and with it:
> auto-cpufreq optimus-manager optimus-manager-qt
and thet set up thes two.



