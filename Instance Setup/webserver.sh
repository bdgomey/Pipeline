#!/bin/bash
apt update
apt upgrade -y
apt install awscli -y
apt install openjdk-11-jdk -y
apt install git
git config --global user.name "Brian"
git config --global user.email "brian.james.gomes@gmail.com"
