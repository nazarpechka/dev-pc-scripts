#/bin/sh

soft_quota=20G
hard_quota=30G

echo 'User creation script'
read -p 'Username: ' username
read -p 'Group (frontend-dev or backend-dev): ' group

password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 10)
encrypted=$(mkpasswd -m sha-512 $password) 

useradd -m -p $encrypted -G $group $username
chage -d 0 -M 120 $username
setquota $username $soft_quota $hard_quota 0 0 /



echo Created user $username \(group $group\) with password $password and quota $hard_quota
