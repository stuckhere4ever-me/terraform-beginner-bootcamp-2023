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


## 9/26

Important Website!
[Terraform Registry](https://registry.terraform.io/)

- Providers is how you map between an API and Terraform.  Example AWS API to be used within Terraform
- Module is a template for providing common actions.  Makes it easier to move stuff around
- [Hashicorp Random Provider](https://registry.terraform.io/providers/hashicorp/random/latest/docs)

- Running Terraform init will start the project together
- It creates a terraform lock that holds the providers and hashes
- Also we create a terraform directory that will download the modules associated
- git ignore allows us to ignore particular things as part of the sync (the terraform directrory in this case)
- `terraform plan` will give us the list of things that will get done
- `terraform apply` will execute commands --auto-approve will allow the changes to be made without prompt

- [AWS Terraform information] https://registry.terraform.io/providers/hashicorp/aws/latest
- `terraform destroy` will destroy resources that have been created within the runtime
- Can use auto-approve


## AWS Login issue

Note - `aws sts get-caller-identity` works locally
To Test I will simply run plan
state is stored locally
In this test - the statefile is created locally and no issues occur
I will run an apply to ensure the s3 bucket is created
S3 bucket has been created
Next I will generate terraform cloud login credentials
Doing an init will successfully migrate the state to terraform cloud but then it appears to no longer use my credentials

I am wondering ... is there a place I can store credentials on TF cloud? 
Or maybe I will have to use a shared file?  But then it will need to be created by hand

Found information on Terraform Cloud Enviornment Variables here:
[Terraform Cloud Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables)

I set Default Region Access Key ID and Secret Access Key as sensitive so they can not be seen and after that it worked!

## generate_tf_cloud_login bash script

Created a bash script to generate the terraform cloud login. It creates a json file that contains both credentials and orginization and places it in the /home/gitpod/.terraform.d directory

the format of the file is as follows:

```json
{
  "credentials": {
    "app.terraform.io": {
      "token": "F2aaIh5eOhAYcc.atlasv1.7775NOPEzo82qN88elI0qgbcyu3Jr0N4rluUqzIHEgsNf5uRxPfJ7DiV3QzwEXoNOPE"
    }
  }
}
```
Updated gitpod yaml file with the following:

```yaml
- name: tfCloud
    before: |
      source ./bin/generate_tf_cloud_login
```
#### ADDED tf alias for terraform
Found information in stack overflow [Alias information](https://stackoverflow.com/questions/8967843/how-do-i-create-a-bash-alias)

Added the following line into ~/.bash_profile:
`alias tf=terraform`

Now we can run terraform commands by typing tf instead
Tested with tf init

But ... there is a problem! .bash_profile will not be updated on startup, so I will need to put something into gitpod.yml.
Should I write a script ... or maybe i can just use append.  Time to go look! 

Found append information in super user:
[Append information](https://superuser.com/questions/678113/how-to-add-a-line-to-bash-profile)

Changed .gitpod.yml to include the following:
`echo 'alias tf=terraform' >>~/.bash_profile`

Also updated gitpod.yml so that terraform cloud ssh key is run as part of the terraform command set

