resource "aws_route53_zone" "ellintech" {
   name = "ellin.tech" 
   force_destroy = true
}

output "nameserver.1" {
    value = "${aws_route53_zone.ellintech.name_servers.0}"
}

output "nameserver.2" {
    value = "${aws_route53_zone.ellintech.name_servers.1}"
}

output "nameserver.3" {
    value = "${aws_route53_zone.ellintech.name_servers.2}"
}

output "nameserver.4" {
    value = "${aws_route53_zone.ellintech.name_servers.3}"
}