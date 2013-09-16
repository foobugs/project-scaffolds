#
# Cookbook Name:: default
# Recipe:: mysql_create_users
#
# Copyright 2013, foobugs Oelke & Eichner GbR
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Create and execute temp sql file for every mysql user
node.default[:default][:mysql][:users].each do |username, user|
    user_item = data_bag_item("mysql_users", "#{username}")
    
    # Path for temp sql file
    sql_path = "/tmp/create-users.sql"

    template sql_path do
      source "tmp/create_users.sql.erb"
      owner "root"
      group "root"
      mode "0600"
      variables(
        :username => "#{username}",
        :privileges => "#{user[:privileges]}",
        :database => "#{user[:database]}",
        :password => user_item["password"]
      )
      action :create
    end

    execute "Create MySQL user '#{username}'" do
      command "#{node[:mysql][:mysql_bin]} -u root #{node[:mysql][:server_root_password].empty? ? '' : '-p' }#{node[:mysql][:server_root_password]} < #{sql_path}"
    end

    # Delete temp sql file
    template sql_path do
      action :delete
    end
end
