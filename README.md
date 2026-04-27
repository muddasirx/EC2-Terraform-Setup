## Prerequisite
- AWS CLI installed and configured
- Terrafrom Installed

## Create Login key-pair
Run Command:
```console
ssh-keygen
```
***Note:** Provide any key name on first prompt and skip rest of prompts by pressing ENTER.*

## EC2 resource file creation
- Create a provider file to specify the region for instance
- Create a variable file and define all necessary variables in it which maybe modidfied in future. (Good practice)
- Create EC2 resource file using above defined varables and other required info
- Create an Output file and define attributes that you want to print on terminal after creation of instance (Optional)

***Note:** You can also run a shell script after creation of the instance by assigning a script to **user_data** in **"aws instance"** resource in **ec2.tf** file.* 

## Initialize Terraform
Run Command:
```console
terraform init
```

## Validate Terraform files
Run Command:
```console
terraform validate
```

## Apply Terraform files
Run Command:
```console
terraform apply
```
***Note:** While doing SSH remove .pem from key name.*
