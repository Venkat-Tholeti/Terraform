resource "aws_route53_record" "www" {
  for_each = aws_instance.Test
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #mongodb.devopsaws.store
  type    = "A"
  ttl     = 300
  records = [each.value.private_ip] # From output.tf 
}