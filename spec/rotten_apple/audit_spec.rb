require 'spec_helper'
require 'rotten_apple'

module RottenApple
  describe Audit do
    before :each do
      @helper = class Helper
                  include RottenApple::Audit
                end.new
    end

    it "should not be running as the root user" do
      @helper.root_user?.should == false
    end

    it "should not be allowed to access the rubygems api key" do
      @helper.rubygems_api_key?.should == false
    end

    it "should not be allowed to access private networks" do
      @helper.private_network_access?.should == false
    end

    it "should not be allowed authenticated ssh access as a github user" do
      @helper.github_ssh_auth_access?.should == false
    end

    it "should not be allowed to make https connections to the Internet" do
      @helper.github_https_access?.should == false
    end

    it "should not be allowed to access other projects" do
      @helper.neighbor_git_projects?.should == false
    end

    it "should not be allowed to access private ssh keys" do
      @helper.private_ssh_keys?.should == false
    end

  end
end