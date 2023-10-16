variable "user_uuid" {
 description = "User UUID"

 type        = string

 validation {
   condition     = can(regex("^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$", var.user_uuid))
   error_message = "Invalid ${var.user_uuid} format. It should be in the form of 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' where x is a hexadecimal character."

 }
}

variable "bucket_name" {
 description = "bucket_name"
 type        = string

 }

variable "index_html_filepath" {
  description = "Filepath to the index.html file"
  type        = string

  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The specified file does not exist."
  }
}

variable "error_html_filepath" {
  description = "Filepath to the error.html file"
  type        = string

  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The specified file does not exist."
  }
}

