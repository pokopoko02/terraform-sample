resource "aws_lb_target_group" "http" {
    name = "sample-http"
    port = 8080
    protocol = "HTTP"
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

    health_check {
        interval = 30
        path = "/health_check"
        port = "traffic-port"
        protocol = "HTTP"
        timeout = 10
        healthy_threshold = 3
        unhealthy_threshold = 3
    }
}