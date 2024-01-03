resource "maas_vm_host" "maasserver" {
  type = "virsh"
  power_address = "qemu+ssh://arash@10.10.10.26/system"
  tags = [
    "pod-console-logging",
    "virtual",
    "kvm",
  ]
}

resource "maas_vm_host_machine" "linux-vm" {
  vm_host = "maasserver"
  #vm_host = maas_vm_host.maasserver.id
  cores = 1
  memory = 2048
  hostname = "linux-vm"
  storage_disks {
    size_gigabytes = 15
  }
  pool = "default"
}

resource "maas_instance" "test-vm" {
  allocate_params {
    min_cpu_count = 2
    min_memory = 2048
  }
  deploy_params {
    distro_series = "jammy"
  }
  depends_on = [maas_vm_host_machine.linux-vm]
}
