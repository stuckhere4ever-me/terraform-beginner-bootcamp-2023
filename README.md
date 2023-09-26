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



## ENV Video
some information that we need to know:
- `env` is a command that will let you view all enviornment variables
- `env | grep GITPOD` will give us information on all variables that contain the string GITPOD in them
- the `|` is a pipe command.  It will pass the output generated from the command on its left to the command on the right
- to print a specific `env variable `echo $<variable name>`
- can set using `export $HELLO='world'`
- can unset using `unset HELLO`
- we can print an envar using `echo $HELLO`

When you open new terminals in VSCode then it will not know about other terminals var.
If you want to set then globally then you need to use bash profiles
We can persist env vars in gitpod secret storage

`gp env HELLO='world'`

Then all future terminals will have $HELLO = 'world'


### AWS CLI Refactor

- AWS CLI is now installed via bash script `install_aws_cli`
- Uppdated the env variable to be the correct $PROJECT_ROOT

We can check if our AWS Credentials are configured correctly by running the command `aws sts get-caller-identity`

[AWS CLI ENV VARS](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

DO NOT PUT YOUR ACCESS KEYS INTO A FILE IN THE REPO!! THEY WILL GET LEAKED AND YOU WILL PAY LOTS OF MONEY!!

#### Testing AWS CLI
You can test the AWS CLI by using the export command and setting the following three variables:

```sh
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
AWS_DEFAULT_REGION=us-east-1
```

#### Setting varialbes in GITPOD
use gp env to set these for all GP enviornments:

`gp env AWS_ACCESS_KEY_ID='AKIAIOSFODNN7EXAMPLE'`
`gp env AWS_SECRET_ACCESS_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'`
`gp env AWS_DEFAULT_REGION='us-east-1'`


