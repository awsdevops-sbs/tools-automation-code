variable "tools" {

    default = {

    prometheus = {
      policy_resource_list = ["ec2:DescribeInstances"]
      instance_type = "t3.small"
    }

      grafana = {
        instance_type = "t3.small"
        policy_resource_list = []
      }

     vault = {
        instance_type = "t3.small"
        policy_resource_list = []
      }

      elk = {
        instance_type = "r7i.large"
        policy_resource_list = []
      }
  }
}

variable "zone_id" {
  default = "Z08526923KQ6ZDBXQJFC1"


}

