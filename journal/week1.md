# Terraform Beginner Bootcamp 2023


## Table of Contents

## Root Module Structure

Our Root Module structure is as follows:

```sh
Project Root/
├── variables.tf         # stores the structure of input variables
├── main.tf              # everything else!
├── outputs.tf           # stores our outputs
├── providers.tf         # defines required providers and their configuration
├── terraform.tfvars     # the data of variables we want to load into our Terraform project
└── README.md            # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)


### variables.tf
This file contains any variables which we have created.  In our example thus far the only variable we are using is:

The structure for adding this file is as follows:

```bash
variable "user_uuid" {
 description = "User UUID"

 type        = string

 validation {
   condition     = can(regex("^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$", var.user_uuid))
   error_message = "Invalid ${var.user_uuid} format. It should be in the form of 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' where x is a hexadecimal character."

 }
}
```

### providers.tf
This file contains any providers we are using.  In our current structure it includes the terraform block as well.
Note that we are currently using the following  providers:
1. AWS - Connects into my AWS enviornment
1. Random - Allows us to generate random numbers
1. Cloud - Allows the use of Terraform Cloud as the state provider


### outputs.tf
This file defines any outputs we are generating.  Currently the following are being used:
1. random_bucket_name - A randomly generated string that will be our bucket name 

### terraform.tfvars 
This file is where we define any terraform variables.  
Several important notes:
1. It will only work when we are managing state locally
1. It is in the .gitignore file so it will not be synced to git

#### Migrating back to local state
In order to speed up tf plan and to use our tfvars file we migrated the state back from TF cloud to local.  This required the following tasks:
1. Perform a tf destroy to remove the existing infrastructure 
1. Delete the lock file (.terraform.lock.hcl)
1. Delete the .terraform directory that contained the downloaded provider information
1. reperform a tf init

#### terraform.tfvars.example
Since tfvars is in the git ignore file, we generated an example file that contains the required documents.  In addition we updated the .gitpod.yml file to create a copy of the local variables.

The code is as follows:
```  - name: aws-clicp $PROJECT_ROOT/terraform.tfvars.example $PROJECT_ROOT/terraform.tfvars```


### Terraform Cloud variables
There are two types of variables in terraform cloud.  They are either enviornment variables or terraform variables.
Enviornment variables are available across the deployment and are generally things that will stay the same long term
Terraform variables are things we are interacting with in our code and may or may not change over a period of time
