#
# Cookbook Name:: init
# Recipe:: default
#
# Copyright 2012, dragon3
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
bash "locale" do
  code <<-EOH
  sed -i 's|LANG=.*|LANG=ja_JP.UTF-8|' /etc/sysconfig/i18n
  EOH
end

# disable iptables
service "iptables" do
  supports :status => true, :restart => true, :reload => true
  action [ :disable, :stop ]
end
