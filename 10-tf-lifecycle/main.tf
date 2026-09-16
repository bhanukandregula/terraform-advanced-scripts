resource "random_integer" "my_random_integer" {
  min = 200
  max = 350

  lifecycle {
    # create_before_destroy = true

    # terraform destroy - to check
    # prevent_destroy = true

    # if you want to ignore any changes in max value
    # then it will create a new one and destroy the old one
    # it won't create new one when the value is changed but it will update the value
    ignore_changes = [
      max,
    ]
  }

}
