resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.lb.arn
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "redirect"
        redirect {
            port = "443"
            protocol = "HTTPS"
            status_code = "HTTP_301"
        }
    }
}

resource "aws_lb_listener" "https" {
    load_balancer_arn = aws_lb.lb.arn
    port = "443"
    protocol = "HTTPS"
    certificate_arn = aws_acm_certificate.container-era.arn
    ssl_policy = "ELBSecurityPolicy-2016-08"
    default_action {
        target_group_arn = aws_lb_target_group.http.arn
        type = "forward"
    }
}