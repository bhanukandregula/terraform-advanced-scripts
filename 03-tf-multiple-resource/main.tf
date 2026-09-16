resource "local_file" "josh_resource" {
  content         = "This is Josh from California"
  filename        = "josh.txt"
  file_permission = "0777"
}

resource "local_file" "alex_resource" {
  content         = "This is Alex from Detriot"
  filename        = "alex.txt"
  file_permission = "0777"
}
