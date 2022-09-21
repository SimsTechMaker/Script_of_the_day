#!/bin/bash

## install p1jenkins

echo "START - install jenkins - "



echo "[2]: install java & jenkins"
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -qq >/dev/null
apt-get install -qq -y default-jre jenkins >/dev/null
systemctl enable jenkins
systemctl start jenkins



echo "[4]: install docker & docker-composer"
curl -fsSL https://get.docker.com | sh; >/dev/null
usermod -aG docker jenkins # authorize docker for jenkins user
curl -sL "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose >/dev/null
chmod +x /usr/local/bin/docker-compose 


systemctl daemon-reload
systemctl restart docker

echo "END - install jenkins"

