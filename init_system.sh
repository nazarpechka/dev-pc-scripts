#/bin/sh


echo Updating system
(apt update && apt -u upgrade) > /dev/null 2>&1

echo ""
echo Installing development soft
apt install -y software-properties-common whois git vim default-jdk > /dev/null 2>&1

echo ""
echo Installing ACL
apt install -y acl > /dev/null 2>&1
echo Add acl option to '/etc/fstab'

echo ""
echo Installing quota tool
apt install -y quota quotatool > /dev/null 2>&1
echo Add 'usrquota' and 'grpquota' options to '/etc/fstab'
echo Also run 'quotacheck -cugm /'

echo ""
echo Adding groups 'frontend-dev' and 'backend-dev'
groupadd -f frontend-dev
groupadd -f backend-dev

echo ""
echo Creating folders for groups - /srv/frontend and /srv/backend
mkdir -p /srv/frontend
chown :frontend-dev /srv/frontend
mkdir -p /srv/backend
chown :backend-dev /srv/backend
chmod 2770 /srv/frontend /srv/backend
setfacl -d -m g::r /srv/frontend
setfacl -d -m g::r /srv/backend
setfacl -d -m u::rw /srv/frontend 
setfacl -d -m u::rw /srv/backend
echo Use setfacl to add group owners access

echo ""
echo Copying scripts to /usr/local/bin
cp user/* /usr/local/bin
cp cron/* /usr/local/bin
chmod +x /usr/local/bin/*
chmod u+s /usr/local/bin/install_soft /usr/local/bin/update_system

echo ""
echo Init attendance logging
mkdir -p /var/log/attend
touch /var/log/attend/attend.log
chmod o+w /var/log/attend/attend.log 

echo Adding jobs to cron \(it will RESET your crontab file\)
crontab crontab.txt
