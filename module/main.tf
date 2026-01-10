resource "aws_instance" "instance" {
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.selected.id]
iam_instance_profile = "aws_iam_role.prometheous_role.name"

  tags = {

    Name= var.tool_name

  }
}


resource "aws_iam_role" "prometheus_role" {
  name = "${var.tool_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_instance_profile" "prometheus_profile" {
  name = "${var.tool_name}-profile"
  role = "aws_iam_role.${var.tool_name}-role.name"
}


resource "aws_route53_record" "internal-record" {
  name    = "${var.tool_name}-internal"
  type    = "A"
  zone_id = "${var.zone_id}"
  records = [aws_instance.instance.private_ip]
  ttl     = "300"
}


resource "aws_route53_record" "record" {
  name    = var.tool_name
  type    = "A"
  zone_id = "${var.zone_id}"
  records = [aws_instance.instance.public_ip]
  ttl     = "300"
}
