resource "aws_route53_zone" "ellintech" {
   name = "ellin.tech" 
   force_destroy = true
}


resource "aws_route53_record" "www_cc" {
   zone_id = "${aws_route53_zone.ellintech.zone_id}"
   name = "www.ellin.tech"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.docker.public_ip}"]
}

resource "aws_route53_record" "apex" {
  zone_id = "${aws_route53_zone.ellintech.zone_id}"
  name    = "ellin.tech"
  type    = "A"

  alias {
    name                   = "www.ellin.tech"
    zone_id                = "${aws_route53_zone.ellintech.zone_id}"
    evaluate_target_health = "false"
  }
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

