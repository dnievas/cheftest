#
# Cookbook Name:: serial-terminal
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

["ttyS0", "ttyS1"].each do |dev|
	template "/etc/init/#{dev}.conf" do
		source "serial-template.erb"
		variables({
			:serial_device => "#{dev}"
		})
		mode 0644
	end

	service "#{dev}" do
		provider Chef::Provider::Service::Upstart
		action :start
	end
end
