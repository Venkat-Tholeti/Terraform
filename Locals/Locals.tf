# Locals are used to store and reuse computed values inside terraform
# Variables accept input from outside

#WHAT WE CAN OVERRIDE, WE WILL USE THEM IN VARIABLES.WHAT WE CANNOT OVERRIDE ARE USED  IN LOCALS.
#WE SHOULD NOT USE LOCALS VERY FREQUENTLY

locals {
  final_name = "${var.project}-${var.environment}-${var.component}"
  ec2_tags = merge(
    var.common_tags,
    {
        environment = "dev",
        version = "1.0"
    }
  )
}