#!/bin/sh
#wget https://gist.githubusercontent.com/pkuczynski/8665367/raw/09ddf3947297e7a$
. ./parse_yaml.sh

# read yaml file
eval $(parse_yaml config.yml "config_")


wget https://raw.githubusercontent.com/vicdoz/debian-post-install/master/sources.list
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/
wget https://raw.githubusercontent.com/vicdoz/debian-post-install/master/preferences
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
$config_git_username ALL=(ALL) ALL " >> /etc/sudoers
gpasswd -a  $config_git_username sudo
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
aptitude install terminator
aptitude install htop
#Preload user process 
aptitude install preload
aptitude install nautilus-gtkhash nautilus-open-terminal
aptitude install lm-sensors hddtemp
sensors-detect
aptitude install nautilus-dropbox
#ADMINER
wget http://downloads.sourceforge.net/adminer/adminer-4.1.0.php
##ANDROID DEVELOPMENT
wget https://dl.google.com/android/adt/adt-bundle-linux-x86_64-20140702.zip
unzip  adt-bundle-linux-x86_64-20140702.zip 
rm -rf adt-bundle-linux-x86_64-20140702.zip 
mkdir /home/vicdoz/android
mv adt-bundle-linux-x86_64-20140702 /home/vicdoz/android

#GENYMOTION
wget http://files2.genymotion.com/genymotion/genymotion-2.2.2/genymotion-2.2.2_x64_debian.bin
chmod +x genymotion-2.2.2_x64_debian.bin
mv genymotion-2.2.2_x64_debian.bin /home/vicdoz/android 
./genymotion-2.2.2_x64_debian.bin

