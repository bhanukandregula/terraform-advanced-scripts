data "local_file" "name" {
  filename = "sample.txt"
}

output "name1" {
  value = data.local_file.name.content
}
