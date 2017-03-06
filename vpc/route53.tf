resource "aws_route53_zone" "ellincc" {
   name = "ellin.cc" 
   force_destroy = true
}

resource "aws_route53_zone" "ellinnet" {
   name = "ellin.net" 
   force_destroy = true
}

resource "aws_route53_record" "www_cc" {
   zone_id = "${aws_route53_zone.ellincc.zone_id}"
   name = "www.ellin.cc"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.docker.public_ip}"]
}

resource "aws_route53_record" "root_cc" {
   zone_id = "${aws_route53_zone.ellincc.zone_id}"
   name = "ellin.cc"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.docker.public_ip}"]
}

resource "aws_route53_record" "www_net" {
   zone_id = "${aws_route53_zone.ellinnet.zone_id}"
   name = "www.ellin.net"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.docker.public_ip}"]
}

resource "aws_route53_record" "root_net" {
   zone_id = "${aws_route53_zone.ellinnet.zone_id}"
   name = "ellin.net"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.docker.public_ip}"]
}