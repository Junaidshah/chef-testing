#!/bin/bash
#yum -y update
yum -y install git mailx
curl -L https://www.opscode.com/chef/install.sh | bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
git clone https://github.com/Junaidshah/chef-testing.git /var/chef-solo
mkdir -p /var/log/chef
touch /var/log/chef/client.log
/usr/bin/chef-solo -c /var/chef-solo/solo.rb -j /var/chef-solo/solo.json > /var/log/chef/client.log 2>&1 

#cd ~
#curl -L https://www.opscode.com/chef/install.sh | bash
#mkdir -p /root/chef-repo/cookbooks
#cd /root/chef-repo/cookbooks
#wget https://raw.githubusercontent.com/Junaidshah/chef-testing/master/postfix-4.0.0.tar.gz
#tar -xzvf postfix-4.0.0.tar.gz
#echo cookbook_path "/root/chef-repo/cookbooks" ~/solo.rb
#chef-solo -c ~/solo.rb -j https://raw.githubusercontent.com/Junaidshah/chef-testing/master/node.json
#yum install -y ruby
#echo foo >> /tmp/foo
