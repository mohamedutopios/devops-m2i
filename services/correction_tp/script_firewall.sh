#!/bin/bash
sudo ufw allow ssh 
sudo ufw default deny incoming
sudo ufw enable
sudo ufw reload