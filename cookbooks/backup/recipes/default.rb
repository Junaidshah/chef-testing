#
# Cookbook Name:: backup
# Recipe:: default
#
# Copyright 2016, TW
#
# All rights reserved - Do Not Redistribute
#

cron 'backup' do
  hour '4'
  minute '20'
  command '/root/backup.sh'
  user "root"
end

template "/root/backup.sh" do
  source "backup.cfg.erb"
  owner "root"
  group "root"
  mode  0755
end

directory "/mnt/backup" do
owner "root"
group "root"
mode "0750"
action :create
end

package "nfs-utils" do
  action :install
end

package "mailx" do
  action :install
end

mount '/mnt/backup' do
  device 'sunfsserver.com:/mirror/backup_uploads'
  fstype 'nfs'
  options 'rw'
  action [:mount, :enable]
end
