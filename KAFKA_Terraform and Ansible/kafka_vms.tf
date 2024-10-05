resource "vcd_vapp_vm" "kafka_nodes" {
  count            = 3
  vapp_name        = "kafka_vapp"
  name             = "kafka-node-${count.index + 1}"
  catalog_name     = "your-catalog"
  template_name    = "ubuntu-20.04-template"
  memory           = 4096
  cpus             = 2

  network {
    orgnetwork     = "your-org-network"
    ip_allocation_mode = "POOL"
  }

  disk {
    name = "disk0"
    size = 50
  }

  metadata = {
    kafka_role = "broker"
  }

  lifecycle {
    create_before_destroy = true
  }
}
