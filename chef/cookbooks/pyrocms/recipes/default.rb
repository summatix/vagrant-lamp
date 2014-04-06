# Make sure the mysql gem is install to prevent errors
gem_package "mysql" do
  action :install
end

DB_NAME = 'pyro'

mysql_connection_info = {
  :host => "localhost",
  :username => "root",
  #:password => node['mysql']['server_root_password']
  :password => "root"
}

mysql_database DB_NAME do
  connection mysql_connection_info
  action [:drop, :create]
end

# Import database from dump file
sqlfile = File.join(Chef::Config[:cookbook_path], 'pyrocms/resources/pyro.sql')
mysql_database DB_NAME do
  connection mysql_connection_info
  sql { ::File.open(sqlfile).read }
  action :query
end
