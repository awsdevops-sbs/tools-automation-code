variable "tools" {

    default = {

    prometheous = {
      policy_resource_list = ["ec2:DescribeInstances"]
      instance_type = "t3.small"
    }

      grafana = {
        instance_type = "t3.small"
        policy_resource_list = []
      }

  }
}

variable "zone_id" {
  default = "Z05837493APAN9ENM4DJN"

}

