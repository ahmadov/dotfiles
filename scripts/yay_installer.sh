mkdir -p /tmp/yay_installer
cd /tmp/yay_installer

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

cd /tmp
rm -rf /tmp/yay_installer
