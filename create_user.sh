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