#!/bin/bash
sudo apt-get update -y

# Jenkins
sudo apt-get install -y openjdk-11-jdk
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y jenkins

# Docker
sudo apt-get install -y docker.io
sudo usermod -aG docker jenkins

sudo systemctl enable jenkins
sudo systemctl enable docker
sudo systemctl restart jenkins
sudo systemctl restart docker
