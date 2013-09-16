#
# Cookbook Name:: default
# Attributes:: nginx
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

default[:default][:nginx][:server_name] = "localhost"
default[:default][:nginx][:access_log] = "localhost.access.log"
default[:default][:nginx][:error_log] = "localhost.error.log"
default[:default][:nginx][:root] = "/vagrant"
default[:default][:nginx][:autoindex] = "on"
default[:default][:nginx][:index] = "index.php index.html"
default[:default][:nginx][:ssl_cert] = "/etc/ssl/certs/ssl-cert-snakeoil.pem"
default[:default][:nginx][:ssl_key] = "/etc/ssl/private/ssl-cert-snakeoil.key"
