variable "service_name" {
  description = "The service enpoint name, should be in the format com.amazonaws.<region>.<service>"
}

variable "endpoint_type" {
  description = "Interface or Gateway (gateway only valid for s3 and dynamodb)"
}

variable "tags" {
  description = "Map of tags to be added to the set of default tags"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "The name of the VPC the endpoints are to be deployed into"
}