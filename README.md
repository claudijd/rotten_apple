![Rotten Apple Logo](https://github.com/claudijd/rotten_apple/blob/master/images/rotten_apple.png?raw=true)

# Rotten Apple

A project for testing continuous integration (CI) or continuous delivery (CD) system security 

## Key Benefits

- **Test Your CI/CD** - Build this project on your CI/CD server to see if there is room for security improvements.
- **Uses Unit-Test Framework** - Use unit-tests not to test this code, but let this code's unit tests test your CI/CD
- **Simple** - The design of this project is to make it simple to test your CI and get clear feedback via PASS/FAIL specs
- **Extensible** - Add new specs to test for the specific things you want to know about your CI
- **Dual-Purpose** - Use RottenApple::Audit to audit a CI/CD or Use RottenApple::Attack (disabled by default) to attack a CI/CD

## Here's how it works

- [Fork](https://github.com/claudijd/rotten_apple/fork_select) the project
- Configure/Add the tests you want to run
- Configure your CI/CD to build this project
- Build it
- Check the Unit-test Results for details

## RottenApple::Audit

This portion of the project is focused on auditing a CI/CD system and is the default name space when the "rake" command is invoked in this project.

Here's the list of audit checks it does right now:

- Is the root user is being to build projects?
- Can malicious code steal your RubyGems API key?
- Could malicious code pivot to private networks?
- Can malicous code authenticate using your GitHub creds?
- Could malicious code receive instructions from a remote party or exfiltrate data from your CI?
- Can malicious code access other projects being built on the same server?
- Can malicious code steal SSH private keys?

## RottenApple::Attack

Conversely, this is the portion of the project that enables you to actively attack a CI/CD. To change to "attack mode", open the Rakefile and change the default to "attack".

Here's the list of attacks it does right now:

- Steal the RubyGems API key
- Flush IP Tables (aka: drop firewall rules)
- Install Software to aid in the attack process
- Make an unauthorized commit to master
- Perform an NMAP scan of a desired set to targets
- Throw/Shovel a reverse shell to get command-line access to the CI/CD
- Steal SSH private keys

## Contributing

If you are interested in contributing to this project, please see [CONTRIBUTING.md](https://github.com/claudijd/rotten_apple/blob/master/CONTRIBUTING.md)

## References

- [Attacking Cloud Services w/ Source Code](https://speakerdeck.com/claudijd/attacking-cloud-services-with-source-code)
- [Make an Unauthorized Commit to Master using Continous Integration Video](https://vimeo.com/65071593)
- [Pop a Reverse Shell using Continous Integration Video](https://vimeo.com/65071592)
- [Securing Continuous Integration Services](http://blog.spiderlabs.com/2013/05/securing-continuous-integration-services.html)

## Credits

[@claudijd](https://github.com/claudijd) is the primary author of this project.

Any additional contributors will be listed here as a sincere thanks for their contributions.
