#
# Cookbook Name:: greyhound
# Recipe:: default
#

include_recipe "database"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "mysql::ruby"

mysql_database node['database']['name'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

mysql_database_user node['database']['db_username'] do
  connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
  password node['database']['db_password']
  database_name node['database']['name']
  privileges [:select,:update,:insert,:create,:delete]
  action :grant
end