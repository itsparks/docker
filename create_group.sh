# Create docker OS group
getent group docker > /dev/null

if [ $? -eq 0 ]; then
    echo "Group docker already exists. Not creating."
else
    echo "Group docker does not exist. Creating."
    groupadd -g 1001 docker
fi