resource "local_file" "name" {
  filename = "helloworld.txt"
  content  = "Welcome to Terraform with multiple providers"
}

resource "random_string" "file_details" {
  length  = 10
  special = false
}

output "file_details" {
  value = random_string.file_details.result
}
