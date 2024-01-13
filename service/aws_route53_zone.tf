data "aws_route53_zone" "container-era" {
    name = "container-era.com"
}
resource "aws_route53_record" "container-era" {
    zone_id = data.aws_route53_zone.container-era.zone_id
    name = data.aws_route53_zone.container-era.name
    type = "A"
    alias {
        name = aws_lb.lb.dns_name
        zone_id = aws_lb.lb.zone_id
        evaluate_target_health = true
    }
}