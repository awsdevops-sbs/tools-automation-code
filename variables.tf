variable "tools" {

    default = {

    prometheous = {
      policy_resource_list = ["ec2:DescribeInstances"]
      instance_type = "t3.small"
    }
  }
}

variable "zone_id" {
  default = "Z05837493APAN9ENM4DJN"

}

