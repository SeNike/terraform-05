env_name = "develop"
network_id     = "develop"

# VPC
vpc_subnets=[{ zone = "ru-central1-a", cidr = "10.0.1.0/24" },{ zone = "ru-central1-b", cidr = "10.0.2.0/24" },{ zone = "ru-central1-d", cidr = "10.0.3.0/24" },]

# VM marketing

subnet_zones_marketing   = ["ru-central1-a"]
instance_name_marketing  = "marketing-vm"
instance_count_marketing = 1
image_family_marketing   = "ubuntu-2004-lts"
public_ip_marketing      = true
owner_marketing          = "i.ivanov"
project_name_marketing   = "marketing"
serial-port-enable_marketing = 1

# VM analytics

subnet_zones_analytics   = ["ru-central1-a"]
instance_name_analytics  = "analytics-vm"
instance_count_analytics = 1
image_family_analytics   = "ubuntu-2004-lts"
public_ip_analytics      = true
owner_analytics          = "i.ivanov"
project_name_analytics   = "analytics"
serial-port-enable_analytics = 1

# Example VM

subnet_zones_example   = ["ru-central1-a"]
instance_name_example  = "web-stage"
instance_count_example = 1
image_family_example   = "ubuntu-2004-lts"
public_ip_example      = true
serial-port-enable_example  = 1