resource "random_integer" "min_max_check" {
  min = 90
  max = 200
}

resource "random_string" "rstring" {
  length = 10
}

output "name01" {
  value = random_integer.min_max_check.result
  # sensitive   = true
  description = "Random integer between 90 and 200"
  depends_on  = []
}

output "name02" {
  value = random_string.rstring.result
  # sensitive   = true
  description = "Random string of length 10"
  depends_on  = []
}
