variable "env_name" {
  description = "Environment name, e.g. production"
  type        = string
}

variable "subnets" {
  description = "List of subnets with zones and CIDRs"
  type = list(
    object({
      zone = string
      cidr = string
    })
  )
}