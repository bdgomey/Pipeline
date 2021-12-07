#!/bin/bash
apt update
apt upgrade -y
apt install openjdk-11-jdk -y
apt install git
git config --global user.name "Brian"
git config --global user.email "brian.james.gomes@gmail.com"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee \
        /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
        https://pkg.jenkins.io/debian-stable binary/ | tee \
        /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update
apt-get install jenkins -y
apt install docker.io -y
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.8.4/binaries/apache-maven-3.8.4-bin.tar.gz
tar -xzvf apache-maven-3.8.4-bin.tar.gz
mv apache-maven-3.8.4 maven
rm -rf apache-maven-3.8.4-bin.tar.gz

