#!/bin/bash

clear

echo "  Changing to root..."
sudo su -

echo "  Updating system..."
apt-get update
apt-get upgrade -y

echo "  Essencial softwares..."
apt install -y --force-yes build-essential curl git rar zip unzip vim tilix postgresql-client-13 ffmpeg ffmpegthumbnailer neofetch libobs-dev

echo "Installing Vscode..."
snap install -y --force-yes --classic code

echo "Installing Mailspring..."
snap install -y --force-yes --classic mailspring

echo "Installing Slack..."
snap install -y --force-yes --classic slack

echo "Installing Insomnia..."
snap install -y --force-yes --classic insomnia

echo "Installing Todoist..."
snap install -y --force-yes --classic todoist

echo "Installing Authy..."
snap install -y --force-yes --classic authy

echo "Installing Gimp..."
snap install -y --force-yes --classic gimp

echo "Installing Discord..."
snap install -y --force-yes discord --classic

echo "Installing bitwarden..."
snap install -y --force-yes bitwarden --classic

echo "Installing oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing oh-my-zsh >> zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing oh-my-zsh >> zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "  Asdf requeriments..."
apt install -y --force-yes dirmngr gpg

echo " Installing asdf..."
cd ~/  && git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8

echo " Installing yarn by asdf..."
asdf plugin-add yarn
asdf install yarn latest

# fix global paths
asdf reshim nodejs

echo " Installing docker..."
apt-get install -y --force-yes \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt install -y --force-yes docker-ce docker-ce-cli containerd.io
usermod -aG docker $USER


echo "Installing docker compose..."
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo " Installing ctop..."
wget https://github.com/bcicen/ctop/releases/download/v0.7.3/ctop-0.7.3-linux-amd64 -O /usr/local/bin/ctop
chmod +x /usr/local/bin/ctop

echo " Installing fonts..."
apt install -y --force-yes fonts-hack-ttf fonts-powerline

echo "Installing dotfiles..."
curl -Lo install.sh https://raw.githubusercontent.com/paulocastellano/dotfiles/master/install.sh
sh install.sh
