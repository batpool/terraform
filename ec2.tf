# for security reasons put variable in environment

# export TF_VAR_aws_access_key="123qwerty"
variable "aws_access_key" {
  type = string
}

# export TF_VAR_aws_secret_key="wertyuiosdfghjkertyuiWERTYURTYUI"
variable "aws_secret_key" {
  type = string
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}


resource "aws_instance" "my-test-instance" {
  ami             = "ami-00068cd7555f543d5"
  instance_type   = "t2.micro"

  tags = {
    Name = "satya"
  }

  key_name = aws_key_pair.deployer.key_name
}

resource "aws_key_pair" "deployer" {
  key_name   = "satya-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8spOQD3d1xuMMCHo2NjLC9mhvOnYsmg6VTxgqiT+by/Q/mKhE8PDO3PlS8n4QyXJl0/ITf98DLTbSgwPY4WLpCT/b4JI4hywm8iOHq/lDaWcVWrp9wQ+ZIKPeR8eYLg0pStigD/4lZPluWMZMHihZneLee+WvPrHz3RLKh9Wb0OTk4ljMGBmUtUSXX9EC2FUWFan1pYbBH1akXaF2qwtghnj4t9/PoXUOUCxAl5l5iFSnK83lv+h0QBJOC+wSyFJH4STGnaEMXgnBOnvtzqKJvtZuCJdEcfXBk9zxmd75ok26XF1itkZZyjwzTs2JNqyJhyCvySr6/83U0o/Kk9xh Satyabrata Swain@B4TMAN"
}
