resource "aws_cloudfront_distribution" "wp_distribution" {
  origin {
    domain_name = "ellin.tech"
    origin_id   = "wp_distribution"
    custom_header 
      {
        name  = "X_CDN" 
        value = "AMAZON"
      }

       custom_origin_config {
          http_port = 80
          https_port = 443
          origin_protocol_policy = "http-only"
          origin_ssl_protocols = ["SSLv3", "TLSv1", "TLSv1.1","TLSv1.2"]
    }

    }
  restrictions {
    geo_restriction {
     restriction_type = "none"
    }
  }

  

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "word press content"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "wp_distribution"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  
  tags {
    Project = "wordpress"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

output "cloudfronturl" {
    value = "${aws_cloudfront_distribution.wp_distribution.domain_name}"
}
