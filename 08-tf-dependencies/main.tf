resource "local_file" "my_file" {
  content  = "Hello World"
  filename = "my_file.txt"
}

resource "random_string" "result_length" {
  length = 10
}

resource "local_file" "explicit_dep" {
  filename   = "explicit.txt"
  content    = " I love random text - ${random_string.result_length.result}"
  depends_on = [random_string.result_length]
}

