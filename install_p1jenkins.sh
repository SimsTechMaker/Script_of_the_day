#!/bin/bash

## install p1jenkins





echo "[2]: config jenkins"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update

echo "installation de  jenkins - "
sudo apt install jenkins


echo "START  jenkins - "

sudo systemctl start jenkins

sudo systemctl status jenkins


echo "[3]: overture des ports "
sudo ufw allow 8080
sudo ufw allow OpenSSH
sudo ufw enable
sudo systemctl start jenkins





echo "END - install jenkins"

