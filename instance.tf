# Create a Virtual Cloud Network (VCN)
resource "oci_core_vcn" "example_vcn" {
  cidr_block     = "10.0.0.0/16"
  display_name   = "example_vcn"
  compartment_id = var.compartment_ocid
}

# Create an Internet Gateway for the VCN
resource "oci_core_internet_gateway" "example_igw" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.example_vcn.id
  display_name   = "example_igw"
  is_enabled     = true
}

# Create a Subnet within the VCN
resource "oci_core_subnet" "example_subnet" {
  cidr_block       = "10.0.1.0/24"
  vcn_id           = oci_core_vcn.example_vcn.id
  compartment_id   = var.compartment_ocid
  display_name     = "example_subnet"
  availability_domain = var.availability_domain
}

# Create a Compute Instance
resource "oci_core_instance" "example_instance" {
  compartment_id = var.compartment_ocid
  availability_domain = var.availability_domain
  shape = "VM.Standard.E3.Flex"
  
  create_vnic_details {
    subnet_id = oci_core_subnet.example_subnet.id
    assign_public_ip = true
    display_name = "example_vnic"
  }

  source_details {
    source_type = "image"
    source_id   = var.image_ocid # Use the OCID of the image you want
    boot_volume_size_in_gbs = 50
  }

  display_name = "example_instance"
  metadata = {
    ssh_authorized_keys = file("~/.ssh/id_rsa.pub")
  }
}