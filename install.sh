#!/bin/sh
#wget https://gist.githubusercontent.com/pkuczynski/8665367/raw/09ddf3947297e7a$
. ./parse_yaml.sh

# read yaml file
eval $(parse_yaml config.yml "config_")


wget sources.list
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/
wget preferences
cp preferences /etc/apt/
aptitude update
aptitude install linux-headers-`uname -r`
aptitude -r -t wheezy-backports install fglrx-legacy-driver
aticonfig --initial
aptitude install firmware-realtek
rebot
aptitude install laptop-mode-tools
aptitude install guake
cp /usr/share/applications/guake.desktop /etc/xdg/autostart/
aptitude install git
git config --global user.name  $config_git_username
git config --global user.email $config_git_mail
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
aptitude install google-chrome-stable
aptitude install deb-multimedia-keyring
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
apt-get install dkms virtualbox-4.2
echo "
nombre_usuario ALL=(ALL) ALL " >> /etc/sudoers
gpasswd -a nombre_usuario sudo
aptitude install gdebi
aptitude install vlc
aptitude install flashplugin-nonfree
aptitude install rar unrar unzip
aptitude install fonts-freefont-otf  texlive-fonts-extra ttf-mscorefonts-installer
#JAVA
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
aptitude install oracle-java7-installer
#PHPSTORM
http://download.jetbrains.com/webide/PhpStorm-7.1.4.tar.gz
tar xfz PhpStorm-*.tar.gz
mv PhpStorm* /var/opt

aptitude install preload
aptitude install nautilus-gtkhash nautilus-open-terminal
aptitude install lm-sensors hddtemp
sensors-detect
aptitude install nautilus-dropbox

