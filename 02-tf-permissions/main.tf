resource "local_sensitive_file" "sample_resource" {
  content         = "This is Bhanu Kandregula"
  filename        = "sample_args.txt"
  file_permission = "0700"
}
