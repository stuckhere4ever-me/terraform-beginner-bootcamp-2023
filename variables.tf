variable "user_uuid" {
 description = "User UUID"

 type        = string

 validation {
   condition     = can(regex("^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$", var.user_uuid))
   error_message = "Invalid ${var.user_uuid} format. It should be in the form of 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' where x is a hexadecimal character."

 }
}