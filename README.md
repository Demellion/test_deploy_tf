# test_deploy_tf

## terraform init
```
module "wordpress" {
	source  = "https://github.com/Demellion/test_deploy_tf"
	version = "0.1.0"
	region = ""
	key_name = ""
	image_owner = ""
	desired_capacity = ""
	max_size = ""
	min_size = ""
}
```
Variables description and details can be found in `variables.tf`