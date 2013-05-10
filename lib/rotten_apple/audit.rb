require 'rotten_apple/common'

module RottenApple
  module Audit
    include RottenApple::Common

    def root_user?
      get_current_user == "root"
    end

    def rubygems_api_key?
      get_rubygems_api_key != nil
    end

    def private_network_access?
      get_private_ip_addresses.any?
    end

    def github_ssh_auth_access?
      get_github_ssh_auth_user != nil
    end

    def github_https_access?
       https_request("https://github.com").body.match(/GitHub/) != nil
    end

    def neighbor_git_projects?
      get_neighbor_git_projects.any?
    end

    def private_ssh_keys?
      get_private_ssh_keys.any?
    end

  end
end