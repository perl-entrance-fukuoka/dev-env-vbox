# -*- coding: utf-8 -*-
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
user "student" do
  comment "Student"
  home "/home/student"
  shell "/bin/bash"
  password "$1$1/7CdRRx$zrMqL6pxlPB7REGd3axCp."
  # usestrict
end

#
# perlbrew の環境構築がリソース不足等でできなかった場合のために
# あらかじめ準備済のユーザ student2
#
user "student2" do
  comment "Student2"
  home "/home/student2"
  shell "/bin/bash"
  password "$1$1/7CdRRx$zrMqL6pxlPB7REGd3axCp."
  # usestrict
end

bash "install-perlbrew" do
  not_if { File.exists?('/home/student2/perl5/perlbrew/etc/bashrc') }
  code <<-EOH
su - student2 -c 'curl -kL http://install.perlbrew.pl | bash'
su - student2 -c 'source ~/perl5/perlbrew/etc/bashrc; echo "source ~/perl5/perlbrew/etc/bashrc" >> ~/.bashrc'
EOH
end

bash "install-perl-5.16.2" do
  not_if { File.exists?('/home/student2/perl5/perlbrew/perls/perl-5.16.2/bin/perl') }
  code <<-EOH
su - student2 -c 'perlbrew -v -n install perl-5.16.2'
su - student2 -c 'perlbrew switch perl-5.16.2; perl -v'
EOH
end

bash "install-cpanm" do
  not_if { File.exists?('/home/student2/perl5/perlbrew/bin/cpanm') }
  code <<-EOH
su - student2 -c 'perlbrew install-cpanm'
EOH
end

bash "install-Plack" do
  not_if { File.exists?('/home/student2/perl5/perlbrew/perls/perl-5.16.2/lib/site_perl/5.16.2/Plack.pm') }
  code <<-EOH
su - student2 -c 'cpanm -n Plack'
EOH
end
