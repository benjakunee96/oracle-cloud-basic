/**
 * Create by : Benja kuneepong
 * Date : Wed, Aug  7, 2024 10:45:12 AM
 * Purpose : ประกาศตัวแปลเริิ่มต้นเพื่อไปใช้ในไฟล์​ var ของแต่ละ environment
 */

variable "oci_region" { default = "ap-singapore-1" }
variable "tenancy_ocid" {}
variable "ssh_public_key" {}
variable "compartment_ocid" {}
variable "AD" { default = "1"}
variable "vcn_cidr" { default = "10.0.0.0/24"}
variable "vcn_dns_label" {
  description = "VCN DNS label"
  default = "vcn01"
}
variable "dns_label" {
  description = "subnet DNS label"
  default = "subnet"
}
// OS Image
variable "image_operating_system" {
  default = "Oracle Linux"
}
variable "image_operating_system_version" {
  default = "8"
}
// Compute Shape
variable "instance_shape" {
  description = "Instance Shape"
  default = "VM.Standard.E2.1.Micro"
}

