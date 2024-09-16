module "vpc_dev" {

  source       = "./modules/vpc"
  env_name     = var.env_name
  subnets      = var.vpc_subnets
}

# Виртуальная машина для проекта "marketing"
module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name
  network_id     = var.network_id
  subnet_zones   = var.subnet_zones_marketing
  subnet_ids     = module.vpc_dev.subnet_ids
  instance_name  = var.instance_name_marketing
  instance_count = var.instance_count_marketing
  image_family   = var.image_family_marketing
  public_ip      = var.public_ip_marketing

  labels = {
    owner   = var.owner_marketing
    project = var.project_name_marketing
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.serial-port-enable_marketing
  }
}

# Виртуальная машина для проекта "analytics"
module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name
  network_id     = var.network_id
  subnet_zones   = var.subnet_zones_analytics
  subnet_ids     = module.vpc_dev.subnet_ids
  instance_name  = var.instance_name_analytics
  instance_count = var.instance_count_analytics
  image_family   = var.image_family_analytics
  public_ip      = var.public_ip_analytics

  labels = {
    owner   = var.owner_analytics,
    project = var.project_name_analytics
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.serial-port-enable_analytics
  }
}
module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.env_name
  network_id     = var.network_id
  subnet_zones   = var.subnet_zones_example
  subnet_ids     = module.vpc_dev.subnet_ids
  instance_name  = var.instance_name_example
  instance_count = var.instance_count_example
  image_family   = var.image_family_example
  public_ip      = var.public_ip_example

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = var.serial-port-enable_example
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username        = var.username
    ssh_public_key  = file(var.ssh_public_key)
    packages        = jsonencode(var.packages)
  }  
}



