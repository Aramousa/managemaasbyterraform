resource "maas_space" "rssbl_space" {
	name = "rssbl-space"
 }

#Fabrics
resource "maas_fabric" "default" {
	name = "maas"
 }

resource "maas_fabric" "rssbl_fabric" {
	name = "rssbl-fabric"
 }

#VLANs
resource "maas_vlan" "rssbl_vlan" {
	fabric = maas_fabric.rssbl_fabric.id
	vid = 11
	name = "rssbl-vlan11"
	space = maas_space.rssbl_space.name
 }

data "maas_vlan" "default" {
	fabric = data.maas_fabric.default.id
	vlan = 0
 }

data "maas_vlan" "vlanid12" {
	fabric = data.maas_facric.default.id
	vlan = 12
 }

#Subnets

data "maas_subnet" "pxe" {
	cidr = "10.20.0.0/16"
 }

data "maas_subnet" "vlanid12" {
	cidr = "10.21.0.0/16"
 }

resource "maas_subnet" "rssbl_subnet" {
	cidr = "10.10.12.0/24"
	fabric = maas_fabric.rssbl_fabric.id
	vlan = maas_vlan.rssbl_vlan.vid
	name = "rssbl_subnet"
	gateway_ip = "10.10.12.1"
	dns_servers = [
		"1.1.1.1",
		"8.8.8.8",  
	 ]
	ip_ranges {
		type = "reserved"
		start_ip = "10.10.12.1"
		end_ip = "10.10.12.110"
	 }
	ip_ranges {
		type = "dynamic"
		start_ip = "10.10.12.150"
		end_ip = "10.10.12.250"
	 }
 }

resource "maas_subnet" "rssbl_subnet_2" {
	cidr = "10.10.13.0/24"
	name = "rssbl_subnet_2"
	fabric = maas_fabric.rssbl_fabric.id
	gateway_ip = "10.10.13.1"
	dns_servers = [
		"1.1.1.1",
		"8.8.8.8"'
 }

resource "maas_subnet_ip_range" "reserved_ip_range" {
	subnet = maas_subnet.rssbl_subnet_2.id
	type = "reserved"
	start_ip = "10.10.13.1"
	end_ip = "10.10.13.110"
	comment = "Reserved for static IPs"
 }

resource "maas_subnet_ip_range" "dynamic_ip_range" {
	subnet = maas_subnet.rssbl_subnet_2.id
	type = "dynamic"
	start_ip = "10.10.13.150"
	end_ip = "10.10.13.250"
 }

# DNS Domains
resource "maas_dns_domain" "runsensible" {
	name = "runsensible"
	ttl = 3600
	authoritative = true
 }

# DNS Records
resource "maas_dns_record" "rssbl-a" {
	type = "A/AAAA"
	data = "10.10.12.101"
	fqdn "rssbl_a.${maas_dns_domain.runsensible.name}"
 }

resource "maas_dns_record" "rssble_aaaa" {
	type = "A/AAAA"
	data = "2001:db8:3333:4444:5555:6666:7777:8888"
	fqdn = "rssbl-aaaa.${maas_dns_domain.runsensible.name}"
 }

resource "maas_dns_record" "rssbl_txt" {
	type = "TXT"
	data = "@"
	name = "rssbl-txt"
	domain = maas_dns_domain.runsensible.name
 }
