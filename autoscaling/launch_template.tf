resource "aws_launch_template" "tem" {
    name                    = "auto-templet"
    description             = "instance"
    disable_api_termination = false
    image_id                = var.image_id
    instance_type           = "t2.micro"
    key_name                = "hengsgg-naver"
    vpc_security_group_ids  = [
        var.instance-sg
    ]
}
