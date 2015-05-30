#
# Cookbook Name:: vines
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'build-essential::default'

package ['ruby',  'rubygems']
package ['ruby-devel']
package ['zlib-devel']

gem_package "vines"

directory node['vines']['path'] do
  owner "root"
  group "root"
  mode  "0755"
  action :create
  recursive true
end

execute "generate-example-vines" do
  cwd node['vines']['path']
  command "vines init wonderland.lit"
  creates node['vines']['path'] + "/wonderland.lit"
end

execute "vines-wonderland" do
  cwd node['vines']['path'] + "/wonderland.lit"
  command "/usr/local/bin/vines -d start"
  creates node['vines']['path'] + "/wonderland.lit/pid/vines.pid"
end
