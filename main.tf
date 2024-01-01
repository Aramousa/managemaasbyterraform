resource "maas_vm_host_machine" "test-ubuntu2204" {
  vm_host = "maas"
  cores = 2
  memory = 2048
  hostname = "test-ubuntu2204"
  storage_disks {
    size_gigabytes = 15
  }
  pool = "default"
}

resource "maas_instance" "test-ubuntu2204" {
  allocate_params {
    min_cpu_count = 2
    min_memory = 2048
  }
  deploy_params {
    distro_series = "jammy"
  }
  depends_on = [maas_vm_host_machine.test-ubuntu2204]
}
