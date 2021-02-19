# Create docker OS group
getent group docker > /dev/null

if [ $? -eq 0 ]; then
    echo "Group docker already exists. Not creating."
else
    echo "Group docker does not exist. Creating."
    groupadd -g 1001 docker
fi

# Create docker OS user if it does not exist and add to docker group. Grant full sudo privileges.
getent passwd docker > /dev/null

if [ $? -eq 0 ]; then
    echo "User docker already exists. Not creating."
else
    echo "User docker does not exist. Creating."
    useradd -d /home/docker -g docker -u 1001 -s /bin/bash docker
    echo "docker123" | passwd docker --stdin # Setting password for user docker
    echo "docker ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/docker-user-sudo
fi

# Switch to docker user
su - docker

# Uninstall old versions
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# Add yum-utils package which gives access to yum-config-manager
sudo yum install -y yum-utils

# Add Docker repository
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# Install Docker & containerd
sudo yum install docker-ce docker-ce-cli containerd.io

# Start Docker
sudo systemctl start docker

# Enable autostart
sudo systemctl enable docker
