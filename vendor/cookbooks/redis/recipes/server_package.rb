#
# Cookbook Name:: redis
# Recipe:: server_package
#
# Copyright 2010, Atari, Inc
# Copyright 2012, CX, Inc
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

include_recipe "redis::_group"
include_recipe "redis::_user"
include_recipe "redis::_server_install_from_package"
include_recipe "redis::_server_service"
include_recipe "redis::_server_config"
