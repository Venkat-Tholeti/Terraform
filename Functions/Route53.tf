resource "aws_route53_record" "www" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}" #mongodb.devopsaws.store
  type    = "A"
  ttl     = 300
  records = [aws_instance.Test[count.index].private_ip] # From output.tf 
}