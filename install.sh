#!/bin/bash

# Main script
/bin/bash create_group.sh
/bin/bash create_user.sh
cp install_docker.sh /home/docker/install_docker.sh
su - docker -c "/bin/bash install_docker.sh"