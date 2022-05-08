#!/bin/bash

#pop-os

sudo apt-get update

sudo apt-get upgrade

#nodejs e npm
sudo apt install curl
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g npm@latest

#virtualbox
#lembrar de trocar versao
sudo sh -c "echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian hirsute contrib' >> /etc/apt/sources.list"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y virtualbox-6.1
wget https://download.virtualbox.org/virtualbox/6.1.26/Oracle_VM_VirtualBox_Extension_Pack-6.1.26.vbox-extpack
sudo virtualbox Oracle_VM_VirtualBox_Extension_Pack-6.1.26.vbox-extpack
rm Oracle_VM_VirtualBox_Extension_Pack-6.1.26.vbox-extpack

#authy
sudo apt install -y snapd
sudo snap install authy

#protonvpn
wget https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb
sudo dpkg -i protonvpn-stable-release_1.0.1-1_all.deb
sudo apt-get update
sudo apt-get install -y protonvpn
rm -rf protonvpn-stable-release_1.0.1-1_all.deb

## COMECAM AS PERGUNTAS MANUAIS

#onlyoffice
sudo sh -c "echo  'deb http://download.onlyoffice.com/repo/debian squeeze main' >> /etc/apt/sources.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
sudo apt-get update
sudo apt-get install -y onlyoffice-desktopeditors

#audacity
sudo add-apt-repository ppa:ubuntuhandbook1/audacity
sudo apt-get update
sudo apt install -y audacity

#docker e docker-compose
 sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
#habilitar uso do docker sem sudo
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

# crontab: bateria

wget https://raw.githubusercontent.com/eduardonbneves/battery-health-notifications/main/battery-health-notifications

sudo apt-get install libnotify-bin
        
chmod +x battery-health-notifications
        
sudo mv battery-health-notifications /usr/bin/ 

echo -e "\nExecute crontab -e e adicione na ultima linha: * * * * * battery-health-notifications"

#mega
wget https://mega.nz/linux/MEGAsync/xUbuntu_21.04/amd64/megasync-xUbuntu_21.04_amd64.deb
sudo apt install -y -f
rm megasync-xUbuntu_21.04_amd64.deb
