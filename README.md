## Prerequisite
- AWS CLI installed and configured
- Terrafrom Installed

## Create Login key-pair
Run Command:
```console
ssh-keygen
```
**Note:** Provide any key name on first prompt and skip rest of prompts by pressing ENTER. 

## EC2 resource file creation
- Create EC2 resource file by providing the required details
- Create a provider file to specify the region for instance

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
**Note:** While doing SSH remove .pem from key name.
