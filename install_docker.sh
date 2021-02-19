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