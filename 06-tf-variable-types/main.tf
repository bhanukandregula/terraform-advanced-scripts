resource "local_file" "file_details" {
  filename = var.file_name
  content  = var.map_content["active"]
}
