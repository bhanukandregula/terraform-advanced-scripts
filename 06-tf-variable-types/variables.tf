variable "file_name" {
  type    = string
  default = "details_file.txt"
}

variable "number_content" {
  type    = number
  default = 33
}

variable "boolean_content" {
  type    = bool
  default = true
}

variable "list_content" {
  type    = list(string)
  default = ["Google Cloud Platform", "Amazon Web Services", "Microsoft Azure"]
}

variable "tuple_content" {
  type    = tuple([string, bool, number])
  default = ["Google Cloud Platform", true, 33]
}

variable "map_content" {
  type = map(string)
  default = {
    "platform" = "Google Cloud Platform"
    "active"   = true
    "count"    = 33
  }
}
