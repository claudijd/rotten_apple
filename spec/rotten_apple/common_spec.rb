require 'spec_helper'
require 'rotten_apple'
require 'common_shared'

module RottenApple
  describe Common do
    before :each do
      @helper = class Helper
                  include RottenApple::Common
                end.new
    end

    describe 'get_current_user' do
      before :each do
        @string = @helper.get_current_user
      end 

      it_should_behave_like "a non-zero length string"
    end

    describe 'get_ip_addresses' do
      before :each do
        @array = @helper.get_ip_addresses
      end

      subject{@array}

      it_should_behave_like "a non-zero length array"

      it "should contain ip addresses" do
        subject.each do | ip_address |
          ip_address.match(/\d+\.\d+\.\d+\.\d+/).should_not be_nil
        end
      end
    end

    describe 'get_env' do
      before :each do
        @string = @helper.get_env('PATH')
      end

      subject{@string}

      it_should_behave_like "a non-zero length string"

      it "should contain some slashes" do
        subject.include?("/").should == true
      end
    end

    describe 'get_hostname' do
      before :each do
        @string = @helper.get_hostname
      end

      subject{@string}

      it_should_behave_like "a non-zero length string"
    end

    describe 'get_rubygems_api_key' do
      before :each do
        @string = @helper.get_rubygems_api_key
      end

      subject{@string}

      it_should_behave_like "a non-zero length string"
    end

    describe 'get_private_ip_addresses' do
      before :each do
        @array = @helper.get_private_ip_addresses
      end

      subject{@array}

      it_should_behave_like "a non-zero length array"

      it "should contain ip addresses" do
        subject.each do | ip_address |
          ip_address.match(/\d+\.\d+\.\d+\.\d+/).should_not be_nil
        end
      end
    end

    describe 'get_github_ssh_auth_user' do
      before :each do
        @string = @helper.get_github_ssh_auth_user
      end

      it_should_behave_like "a non-zero length string"
    end

    describe 'get_private_ssh_keys' do
      before :each do
        @array = @helper.get_private_ssh_keys
      end

      subject{@array}

      it_should_behave_like "a non-zero length array"

      it "should contain PRIVATE ssh keys" do
        subject.each do |ssh_key|
          ssh_key.match(/PRIVATE/).should_not be_nil
        end
      end
    end
  end
end