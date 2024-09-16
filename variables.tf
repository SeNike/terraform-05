###cloud vars

variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "username" {
  type    = string
  default = "ubuntu"
}

variable "ssh_public_key" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "packages" {
  type = list(string)
  default = ["nginx", "vim"]
}

variable "env_name" {
  type    = string
  default = "development"
  description = "Environment name"
}

variable "network_id" {
  type    = string
  default = "development"
  description = "Network ID"
}

variable "subnet_zones_marketing" {
  type = list(string)
  default = ["ru-central1-a"]
  description =  "Default zone"
}      

variable "instance_name_marketing"  {
  type    = string
  default = "marketing-vm"
  description = "instance_name_marketing"
} 

variable "instance_count_marketing"  {
  type    = number
  default = 1
  description = "instance_count_marketing"
} 

variable "image_family_marketing"  {
  type    = string
  default = "ubuntu-2004-lts"
  description = "image_family_marketing"
} 

variable "public_ip_marketing"  {
  type    = bool
  default = true
  description = "public_ip_marketing"
} 

variable "owner_marketing"  {
  type    = string
  default = "i.ivanov"
  description = "Project owner"
} 

variable "project_name_marketing"  {
  type    = string
  default = "marketing"
  description = "Project name"
} 

variable "serial-port-enable_marketing"  {
  type    = number
  default = 1
  description = "serial-port-enable_marketing"
}

variable "vpc_subnets" {
  type = list
  description =  "VPC subnets"
} 

#################

variable "subnet_zones_analytics" {
  type = list(string)
  default = ["ru-central1-a"]
  description =  "Default zone"
}      

variable "instance_name_analytics"  {
  type    = string
  default = "marketing-vm"
  description = "instance_name_analytics"
} 

variable "instance_count_analytics"  {
  type    = number
  default = 1
  description = "instance_count_analytics"
} 

variable "image_family_analytics"  {
  type    = string
  default = "ubuntu-2004-lts"
  description = "image_family_analytics"
} 

variable "public_ip_analytics"  {
  type    = bool
  default = true
  description = "public_ip_analytics"
} 

variable "owner_analytics"  {
  type    = string
  default = "i.ivanov"
  description = "Project owner"
} 

variable "project_name_analytics"  {
  type    = string
  default = "marketing"
  description = "Project name"
} 

variable "serial-port-enable_analytics"  {
  type    = number
  default = 1
  description = "serial-port-enable_marketing"
}

#################

variable "subnet_zones_example" {
  type = list(string)
  default = ["ru-central1-a"]
  description =  "Default zone"
}      

variable "instance_name_example"  {
  type    = string
  default = "marketing-vm"
  description = "instance_name"
} 

variable "instance_count_example"  {
  type    = number
  default = 1
  description = "instance_count"
} 

variable "image_family_example"  {
  type    = string
  default = "ubuntu-2004-lts"
  description = "image_family"
} 

variable "public_ip_example"  {
  type    = bool
  default = true
  description = "public_ip"
} 

variable "serial-port-enable_example"  {
  type    = number
  default = 1
  description = "serial-port-enable"
}
