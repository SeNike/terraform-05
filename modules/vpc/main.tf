resource "yandex_vpc_subnet" "this" {
  for_each = { for subnet in var.subnets : subnet.zone => subnet }

  name           = "${var.env_name}-${each.key}-subnet"
  zone           = each.value.zone
  v4_cidr_blocks = [each.value.cidr]
  network_id     = yandex_vpc_network.this.id
}

resource "yandex_vpc_network" "this" {
  name = "${var.env_name}-network"
}