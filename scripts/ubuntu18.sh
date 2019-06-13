#!/bin/bash

## script automates the process of setting up a new virutal machine

## update apt
echo "updating apt"
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo add-apt-repository universe
sudo apt update
sudo apt upgrade -y
sudo apt install -y build-essential curl file git apt-transport-https
sudo apt install -y dotnet-sdk-2.2
echo "apt update completed"

## Mount Disk
echo "mounting disk"
sudo mkfs -t ext4 /dev/sdc
sudo mkdir /media/diskholder
sudo mount /dev/sdc /media/diskholder/
echo "disk mounted"

## set up brew - installation instructions from https://docs.brew.sh/Homebrew-on-Linux
echo "brew install started"
echo "" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
echo "brew install complete"

## install tools
echo "tooling started"
brew install gcc git node
echo "tooling complete"

## exit script
echo "installation complete"
