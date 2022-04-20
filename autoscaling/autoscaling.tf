resource "aws_autoscaling_group" "tutorial" {
    # availability_zones        = [
    #     var.region-a,
    #     var.region-c,
    # ]
    capacity_rebalance        = false
    default_cooldown          = 300
    desired_capacity          = 2
    enabled_metrics           = []
    health_check_grace_period = 300
    health_check_type         = "EC2"
    load_balancers            = []
    max_instance_lifetime     = 0
    max_size                  = 10
    metrics_granularity       = "1Minute"
    min_size                  = 2
    name                      = "tutorial-asg"
    protect_from_scale_in     = false
    suspended_processes       = []
    target_group_arns         = [
        aws_lb_target_group.tutorial.arn,
    ]
    termination_policies      = []
    vpc_zone_identifier       = [
        var.public_subnet_id-a,
        var.public_subnet_id-c,
    ]

    launch_template {
        id      = aws_launch_template.tem.id
        version = "$Default"
    }
}
