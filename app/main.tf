module "jenkins_keypair" {
  source   = "../modules/keypair"
  key_name = "my-ec2-key"
  tags = {
    Project     = "Mini-projet-commun"
  }
  private_key_path = var.private_key_path
}

module "jenkins_vpc" {
  source         = "../modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_tags = {
    "Name" = "jenkins-vpc"
  }
}

module "jenkins_igw" {
  source = "../modules/igw"
  vpc_id = module.jenkins_vpc.vpc_id
  igw_tags = {
    "Name" = "jenkins-igw"
  }
}

module "jenkins_subnet" {
  source            = "../modules/subnet"
  subnet_cidr_block = var.subnet_cidr_block
  subnet_tags = {
    "Name" = "jenkins-public-subnet"
  }
  az     = var.app_az
  vpc_id = module.jenkins_vpc.vpc_id
}

module "jenkins_rtb" {
  source = "../modules/rtb"
  vpc_id = module.jenkins_vpc.vpc_id
  rtb_tags = {
    "Name" = "jenkins-rtb"
  }
}

module "jenkins_internet_route" {
  source = "../modules/route"
  route_table_id = module.jenkins_rtb.rtb_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.jenkins_igw.igw_id
}

resource "aws_route_table_association" "my_rta" {
  subnet_id      = module.jenkins_subnet.subnet_id
  route_table_id = module.jenkins_rtb.rtb_id
}


module "jenkins_sg" {
  source = "../modules/sg"
  sg_vpc_id = module.jenkins_vpc.vpc_id
  sg_name = "jenkins_sg"
  sg_tags = {
    Name = "jenkins-sg"
  }

  ingress_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "allow SSH inbound traffic" },
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "allow HTTP inbound traffic" },
    { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "allow HTTPS inbound traffic" },
    { from_port = 8080, to_port = 8080, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "allow HTTPS inbound traffic" }
    # { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "allow all traffic" }
  ]
}

module "jenkins_ec2" {
  source = "../modules/ec2"
  ec2_subnet_id = module.jenkins_subnet.subnet_id
  ec2_az            = var.app_az
  ec2_instance_type = "t3.micro"
  ec2_key_name      = module.jenkins_keypair.key_name
  ec2_sg_ids        = [module.jenkins_sg.security_group_id]
  ec2_tags = {
    Name = "jenkins-ec2"
  }
  ec2_root_volume_size = 10
}

module "jenkins_ebs" {
  source = "../modules/ebs"

  ebs_az   = var.app_az
  ebs_size = 15
  ebs_tags = {
    Name = "jenkins-ebs"
  }
}

module "jenkins_eip" {
  source = "../modules/eip"

  eip_tags = {
    Name = "jenkins-eip"
  }
}

resource "aws_volume_attachment" "jenkins_ebs_attachment" {
  device_name = "/dev/sdh"
  volume_id   = module.jenkins_ebs.ebs_id
  instance_id = module.jenkins_ec2.ec2_id
}

resource "aws_eip_association" "jenkins_eip_association" {
  instance_id   = module.jenkins_ec2.ec2_id
  allocation_id = module.jenkins_eip.eip_id
}

resource "null_resource" "output_metadata" {
  depends_on = [module.jenkins_ec2, module.jenkins_eip,
                module.jenkins_ebs, aws_volume_attachment.jenkins_ebs_attachment]


  provisioner "remote-exec" {
      connection {
        type        = "ssh"
        user        = "ubuntu" 
        private_key = file(var.private_key_path)
        host        = module.jenkins_eip.eip_public_ip
        timeout     = "10m"  # Timeout de 10 minutes
      }
  
      inline = [
    #    "echo '1. Mise à jour et installation des paquets Docker'",
         "sudo apt update -y",
         "sudo apt-get upgrade -y", 
         "sudo apt-get install -y ca-certificates curl gnupg lsb-release",
         "sudo curl -fsSL https://get.docker.com | sh",
         "sudo systemctl enable docker",
         "sudo systemctl restart docker",
         "sudo usermod -aG docker ubuntu",
  
    #    "echo '2. Préparation et installation du composant docker-compose'",
         "sudo mkdir -p /usr/local/lib/docker/cli-plugins",
         "sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose",
         "sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose",
  
    #    "echo '3. Création du répertoire jenkins'",
         "sudo mkdir -p /opt/jenkins",
         "sudo chown ubuntu:ubuntu /opt/jenkins",
  
    #    "echo '4. Création du docker-compose.yml'",
         "echo \"version: '3.8'\nservices:\n  jenkins:\n    image: jenkins/jenkins:lts\n    container_name: jenkins\n    restart: unless-stopped\n    ports:\n      - '8080:8080'\n      - '50000:50000'\n    volumes:\n      - jenkins_home:/var/jenkins_home\nvolumes:\n  jenkins_home:\" | sudo tee /opt/jenkins/docker-compose.yml",
  
    #    "echo '5. Lancement du service jenkins'",     
         "sudo docker compose -f /opt/jenkins/docker-compose.yml up -d"
      ]
    }
  
  provisioner "local-exec" {
      command = "echo jenkins EC2 PUBLIC_IP: ${module.jenkins_eip.eip_public_ip} - jenkins EC2 PUBLIC_DNS: ${module.jenkins_eip.eip_public_dns}  >> jenkins_ec2.txt"
    }
} 