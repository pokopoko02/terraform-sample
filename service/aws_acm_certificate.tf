resource "aws_acm_certificate" "container-era" {
    domain_name = data.aws_route53_zone.container-era.name
    subject_alternative_names = []
    validation_method = "DNS"
}