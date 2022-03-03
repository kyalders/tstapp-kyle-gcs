##########################
### General variables ####   
variable "project_id" {
  type        = string
  description = "ID of the project."
}

variable "env" {
  type        = string
  description = "environment"
}

##########################
### Bucket variables ####   
variable "name" {
  type        = string
  description = "name of storage bucket"
}
