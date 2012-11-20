#
# Cookbook Name:: perlbrew
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
user "user1" do
  comment "User1"
  home "/home/user1"
  shell "/bin/bash"
  password "$1$1/7CdRRx$zrMqL6pxlPB7REGd3axCp."
  # usestrict
end

bash "install-perlbrew" do
  code <<-EOH
su - user1 -c 'curl -kL http://install.perlbrew.pl | bash'
su - user1 -c 'source ~/perl5/perlbrew/etc/bashrc; echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc'
EOH
end

bash "install-perl-5.14.3" do
  code <<-EOH
su - user1 -c 'perlbrew -v -n install perl-5.14.3'
su - user1 -c 'perlbrew switch perl-5.14.3; perl -v'
EOH
end

bash "install-cpanm" do
  code <<-EOH
su - user1 -c 'perlbrew install-cpanm'
EOH
end

# bash "install-Module-Install" do
#   code <<-EOH
# su - user1 -c 'cpanm Module::Install Module::Install::AuthorTests Module::Install::Repository'
# EOH
# end
