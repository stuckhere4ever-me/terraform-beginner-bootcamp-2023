# Terraform Beginner Bootcamp 2023
## Semantic Versioning :mage:

This project will use Semantic Versioning for its tagging

![semver.org](https://semver.org/)

The general format will be **MAJOR.MINOR.PATCH**, eg `1.0.1`

1. **MAJOR** version when you make incompatible API changes
1. **MINOR** version when you add functionality in a backward compatible manner
1. **PATCH** version when you make backward compatible bug fixes


## Document Changes 9/25

1. Found that terraform cli was not installing correctly, was waiting on an enter
1. Ran each command and found that issue was in the apt-get command 
1. Added a -y but it was still having issues with the a deprecated key pair
1. Adjusted to new installation instructions
1. Pulled them out into a script (install_terraform_cli.sh) and validated it ran correctly
1. Had to adjust permissions
1. Adjusted .gitpod.yml to utilize the running script and adjusted to use begin rather than init since init only runs on initial startup

