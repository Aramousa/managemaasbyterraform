# VM Host 1
resource "maas_vm_host" "kvm" {
	type = "virsh"
	power_address = "qemu+ssh://arash@10.10.10.26/system"
	tags = [
		"pod-console-logging",
		"virtual",
		"kvm",
	 ]
 }

resource "maas_vm_host_machine" "kvm" {
	count = 2
	vm_host = maas_vm_host.kvm.id
	cores = 1
	memory = 2048

	storage_disks {
	size_gigabytes = 15
	 }
 }

# VM Host 2
resource "maas_vm_host" "maas_machine" {
	type = "virsh"
	machine = maas_machine.virsh_vm3.hostname
 }

resource "maas_vm_host_machine" "maas_machine_1" {
	vm_host = maas_vm_host.maas_machine.id

	network_interfaces {
		name = "eth0"
		subnet_cidr = maas_subnet.pxe.cidr
	 }

	storage_disks {
		size_gigabytes = 10
	 }
	storage_disks {
		size_gigabytes = 15
	 }
 }

resource "maas_vm_host_machine" "maas_machine_2" {
	vm_host = maas_vm_host.maas_machine.id

	network_interfaces {
		name = "eth0"
		ip_address = "10.99.3.107"
	 }

	storage_disks {
		size_gigabytes = 21
	 }
 }
