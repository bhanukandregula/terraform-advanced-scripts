resource "local_file" "sample_resource" {
  content  = "This is a sample file created by Terraform."
  filename = "sample.txt"
}
