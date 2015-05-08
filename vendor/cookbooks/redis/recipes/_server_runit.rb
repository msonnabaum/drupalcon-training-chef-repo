#
# Cookbook Name:: redis
# Recipe:: _server_runit

include_recipe "runit"

runit_service "redis"
