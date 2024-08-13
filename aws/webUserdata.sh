#!/bin/bash

#install apache
sudo yum -y install httpd

#enable and start apache
sudo systemctl enable httpd
sudo systemctl start httpd

cd /etc/httpd/conf

echo "LoadModule proxy_module modules/mod_proxy.so" >> httpd.conf
echo "LoadModule proxy_http_module modules/mod_proxy_http.so" >> httpd.conf
echo "ProxyPass / http://10.0.138.100:80/" >> httpd.conf
echo "ProxyPassReverse / http://10.0.138.100:80/" >> httpd.conf

#internal-app-2103124511.us-east-1.elb.amazonaws.com

#sed -i 's/10.0.138.100/internal-app-2103124511.us-east-1.elb.amazonaws.com/g' /etc/httpd/conf/httpd.conf