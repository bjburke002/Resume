provider "aws" {
    region = "us-east-1"
}

data "aws_vpc" "default" {
    default = true
}

data "aws_subnet_ids" "default" {
    vpc_id = data.aws_vpc.default.id
}

data "aws_iam_policy_document" "bucket_policy" {
    statement {
        sid = "PublicReadGetObject"
        effect = "Allow"
        actions = [ "s3:GetObject" ]
        principals {
            type = "*"
            identifiers = [ "*" ]
        }
        resources = [ "arn:aws:s3:::brian-burke-resume/*" ]
    }

    statement {
        sid = "2"
        effect = "Allow"
        actions = [ "s3:GetObject" ]
        principals {
            type = "AWS"
            identifiers = [ "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E3PW2UP2YY9LP2" ]
        }
        resources = [ "arn:aws:s3:::brian-burke-resume/*" ]
    }
}

resource "aws_s3_bucket" "brian-burke-resume" {
    bucket = "brian-burke-resume"
    acl = "public-read"

    tags = {
        Name = "Brian Burke Resume host"
    }

    policy = data.aws_iam_policy_document.bucket_policy.json
    website {
        index_document = "index.html"
        error_document = "error.html"
    }
}

locals {
    s3_origin_id = "S3-brian-burke-resume/resume"
}

resource "aws_cloudfront_distribution" "resume_distribution" {
    origin {
        domain_name = aws_s3_bucket.brian-burke-resume.bucket_regional_domain_name
        origin_id = local.s3_origin_id

        s3_origin_config {
            origin_access_identity = "origin-access-identity/cloudfront/E3PW2UP2YY9LP2"
        }
    }

    enabled = true
    is_ipv6_enabled = false
    default_root_object = "index.html"

    logging_config {
        include_cookies = false
        bucket = "-"
        prefix = "-"
    }

    aliases = [ "brianjburke.com", "www.brianjburke.com" ]

    default_cache_behavior {
        allowed_methods = [ "GET", "HEAD" ]
        cached_methods = ["GET", "HEAD" ]
        target_origin_id = local.s3_origin_id

        forwarded_values {
            query_string = false

            cookies {
                forward = "none"
            }
        }

        min_ttl = 0
        default_ttl = 60
        max_ttl = 60
        viewer_protocol_policy = "redirect_to_https"
    }    

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    price_class = "PriceClass_All"

    viewer_certificate {
        acm_certificate_arn = "	arn:aws:acm:us-east-1:985504337819:certificate/7f15685f-7d84-49ea-9639-e9901800a1ef"
    }
} 

output "resume_bucket_url" {
    value = aws_s3_bucket.brian-burke-resume.website_endpoint
}