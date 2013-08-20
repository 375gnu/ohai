#
# Author:: Adam Jacob (<adam@opscode.com>)
# Author:: Tollef Fog Heen <tfheen@err.no>
# Copyright:: Copyright (c) 2008 Opscode, Inc.
# Copyright:: Copyright (c) 2010 Tollef Fog Heen <tfheen@err.no>
# License:: Apache License, Version 2.0
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

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')

describe Ohai::System, "plugin ohai" do
  before(:each) do
    @ohai = Ohai::System.new
    @plugin = Ohai::DSL::Plugin.new(@ohai, File.join(PLUGIN_PATH, "ohai.rb"))
    @plugin.stub(:require_plugin).and_return(true)
  end
  
  it "should set [:chef_packages][:ohai][:version] to the current version" do
    @plugin.run
    @plugin[:chef_packages][:ohai][:version].should == Ohai::VERSION
  end
end
