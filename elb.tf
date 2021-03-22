resource "aws_elb" "bar" {
  name = "foobar-terraform-elbs"
  security_groups = ["${aws_security_group.asg-sec-group.id}"]

  availability_zones = [
    "${var.region}a",
    "${var.region}b",
    "${var.region}c"
  ]

  listener {
    instance_port  = 80
    instance_protocol = "http"
    lb_port  = 80
    lb_protocol  = "http"
  }

  # Since its WP its better to check a bit slower timeout as it prone to being stuck executing scripts.
  health_check {
    healthy_threshold  = 2
    unhealthy_threshold = 2
    timeout  = 60
    target  = "HTTP:80/"
    interval  = 120
  }

  cross_zone_load_balancing  = true
  idle_timeout  = 300
  connection_draining  = true
  connection_draining_timeout = 300

  tags = {
    Name = "foobar-terraform-elbs"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = "${aws_autoscaling_group.example.id}"
  elb = "${aws_elb.bar.id}"
}