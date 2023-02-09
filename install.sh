#!/bin/bash

# Check if the system is Ubuntu or CentOS
if [ -f /etc/lsb-release ]; then
  OS="Ubuntu"
  CON_NAME="allproxyS.conf"
elif [ -f /etc/redhat-release ]; then
  sudo yum install -y epel-release
  OS="CentOS"
  CON_NAME="allproxyS.ini"
else
  echo "This script is only compatible with Ubuntu and CentOS systems."
  exit 1
fi

# Update the package list and upgrade existing packages
if [ "$OS" == "Ubuntu" ]; then
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get install -y gnupg
elif [ "$OS" == "CentOS" ]; then
  sudo yum update -y
fi

# Import the MongoDB public key
if [ "$OS" == "Ubuntu" ]; then
  wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
elif [ "$OS" == "CentOS" ]; then
  sudo rpm --import https://www.mongodb.org/static/pgp/server-4.4.asc
fi

# Create a list file for MongoDB
if [ "$OS" == "Ubuntu" ]; then
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
  sudo apt-get update
  sudo apt-get install -y mongodb-org
elif [ "$OS" == "CentOS" ]; then
  echo -e "[mongodb-org-4.4]\nname=MongoDB Repository\nbaseurl=https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/4.4/x86_64/\ngpgcheck=1\nenabled=1\ngpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc" | sudo tee /etc/yum.repos.d/mongodb-org-4.4.repo
  sudo yum install -y mongodb-org
fi

# Start the MongoDB service and enable it to start on boot
sudo systemctl start mongod
sudo systemctl enable mongod

# Install Supervisor
if [ "$OS" == "Ubuntu" ]; then
  sudo apt-get install -y supervisor
elif [ "$OS" == "CentOS" ]; then
  sudo yum install -y supervisor
fi



# Create the default application configuration file for Supervisor
sudo echo -e "[program:allproxyS]\ndirectory=/root/allproxyS\ncommand=/root/allproxyS/allproxyS_x\nuser=root\nstopsignal=INT\nautostart=true\nautorestart=true\nstartretries=3\nstderr_logfile=/var/log/allproxys.err.log\nstdout_logfile=/var/log/allproxys.out.log" > /etc/supervisor/conf.d/$CON_NAME

#change minfds
sudo sed -i '/\[supervisord\]/a minfds=200000   ;' /etc/supervisor/supervisord.conf
sudo echo "* soft nofile 200000" | sudo tee -a /etc/security/limits.conf
sudo echo "* hard nofile 200000" | sudo tee -a /etc/security/limits.conf
sudo systemctl restart supervisor

echo "Installation complete!"

