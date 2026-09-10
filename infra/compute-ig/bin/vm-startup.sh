#! /bin/bash
yum -y update
yum -y install ${web_server}
systemctl start ${web_server}
echo "Hello from us-central1" > /var/www/html/index.html
