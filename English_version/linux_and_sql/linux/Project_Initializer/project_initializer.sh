#!/bin/bash -i

echo "Welcome $(whoami)!"
echo "$(date)"

# Create the main project structure
mkdir -p projects/users_team
cd projects
mkdir admin_team security_team

# Create members in users_team
cd users_team
mkdir Gabens Don Danirode Lyncold

# Go back to the root of the script
cd ../..

# Create a new user and group
sudo useradd -m apm
sudo groupadd admin_team
sudo usermod -aG admin_team apm
sudo chgrp admin_team projects/admin_team
sudo passwd apm

# Create and assign ownership of command history
touch projects/users_team/history_command
history > projects/users_team/history_command
sudo chown apm projects/users_team/history_command

# Restrict access for other users
sudo chmod o-r projects/admin_team projects/security_team

# Archive the project folder
tar -czvf projects.tar.gz projects
