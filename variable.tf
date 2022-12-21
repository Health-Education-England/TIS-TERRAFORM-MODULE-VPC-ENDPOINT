variable "service_name" {
  description = "The service enpoint name, should be in the format com.amazonaws.<region>.<service>"
}

variable "endpoint_type" {
  description = "Interface or Gateway (gateway only valid for s3 and dynamodb)"
}

variable "vpc_name" {
  description = "The name of the VPC the endpoints are to be deployed into"
}