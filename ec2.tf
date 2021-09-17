# Demo EC2 Deploy
resource "aws_instance" "demo-ec2" {
  ami                    = var.aws_ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags                   = merge(var.demo-startstop, { Name = "${var.tag_project}-ec2" }, { Auto-StartStop-Enabled = "true" })

  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
    tags                  = merge(var.demo-startstop, { Name = "${var.tag_project}-ebs" }, )
  }
}