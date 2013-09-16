#
# Cookbook Name:: default
# Recipe:: nginx
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

package "ssl-cert" do
  action :install
end

nginx_cert = data_bag_item("nginx_certs", "default")

file "#{node[:default][:nginx][:ssl_cert]}" do
  content nginx_cert["cert"]
  owner "root"
  group "root"
  mode "0644"
end

file "#{node[:default][:nginx][:ssl_key]}" do
  content nginx_cert["key"]
  owner "root"
  group "ssl-cert"
  mode "0640"
end

template "#{node[:nginx][:dir]}/sites-available/default" do
  source "etc/nginx/sites-available/default.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
    :server_name => node[:default][:nginx][:server_name],
    :access_log => node[:default][:nginx][:access_log],
    :error_log => node[:default][:nginx][:error_log],
    :root => node[:default][:nginx][:root],
    :autoindex => node[:default][:nginx][:autoindex],
    :index => node[:default][:nginx][:index],
    :ssl_cert => node[:default][:nginx][:ssl_cert],
    :ssl_key => node[:default][:nginx][:ssl_key],
  )
end

file "#{node[:nginx][:dir]}/conf.d/default.conf" do
  action :delete
end

file "#{node[:nginx][:dir]}/conf.d/example_ssl.conf" do
  action :delete
end
