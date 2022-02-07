variable "cluster_name" {
    description = "The name ot use for all the cluster resources"
    type = string
}

variable "ami" {
    description = "The AMI to run in the cluster"
    default = "ami-0c55b159cbfafe1f0"
    type = string
}

variable "instance_type" {
    description = "The type of EC2 Instances to run"
    type = string
}

variable "min_size" {
    description = "The minimum number of EC2 Instances in the ASG"
    type = number
}

variable "max_size" {
    description = "The maximum number of EC2 Instances in the ASG"
    type = number
}

variable "enable_autoscaling" {
    description = "If set to true, enable autoscaling"
    type = bool
}

variable "custom_tags" {
    description = "Custom tags to set on the Instances in the ASG"
    type = map(string)
    default = {}
}

variable "server_port" {
    description = "The port the server will use for HTTP requests"
    type        = number
    default     = 8080
}
