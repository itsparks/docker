#!/bin/bash

# Main script
# Create OS group "docker"
/bin/bash create_group.sh

# Create OS user "docker"
/bin/bash create_user.sh

# Copy file and change some permissions
cp install_docker.sh /home/docker/install_docker.sh
chown docker:docker /home/docker/install_docker.sh
chmod 700 /home/docker/install_docker.sh

# Switch user to docker and run install
su - docker -c "/bin/bash install_docker.sh"