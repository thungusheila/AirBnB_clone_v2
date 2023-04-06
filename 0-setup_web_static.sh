#!/usr/bin/env bash
# sets up the web servers for the deployment of web_static

#To install nginx after updating apt
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install nginx

#creating the folders that are to be served by nginx
sudo mkdir -p /data/web_static/releases/test /data/web_static/shared
echo "Hello and welcome" | sudo tee /data/web_static/releases/test/index.html

#create the symbolic link
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

#set the permissions 
sudo chown -hR ubuntu:ubuntu /data/

#set configuration details
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default

#restarting nginx
sudo service nginx start
