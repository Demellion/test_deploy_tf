variable "region" {
	type = string
	description = "Provider region. Will be used to autoscale region after."
}
variable "key_name" {
	type = string
	description = "AWS key pair."
	sensitive = true
}
variable "image_owner" {
	type = string
	description = "Amazon Machine Image ID"
	sensitive = true
}
variable "desired_capacity" {
	type = string
	description = "Desired capacity of deploy"
}
variable "max_size" {
	type = string
	description = "Max capacity size"
}
variable "min_size" {
	type = string
	description = "Min capacity size"
}