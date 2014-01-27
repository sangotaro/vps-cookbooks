#
# Cookbook Name:: site_simple_iptables
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Reject packets other than those explicitly allowed
simple_iptables_policy "INPUT" do
  policy "DROP"
end

# Allow all traffic on the loopback device
simple_iptables_rule "system" do
  rule "--in-interface lo"
  jump "ACCEPT"
end

# Allow SSH
simple_iptables_rule "system" do
  rule "--proto tcp --dport 22"
  jump "ACCEPT"
end

# Allow HTTP
simple_iptables_rule "http" do
  rule "--proto tcp --dport 80"
  jump "ACCEPT"
end
