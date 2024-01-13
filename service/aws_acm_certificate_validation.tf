resource "aws_acm_certificate_validation" "container-era" {
    certificate_arn = aws_acm_certificate.container-era.arn
    validation_record_fqdns = [for record in aws_route53_record.container_era_certificate : record.fqdn]
}
