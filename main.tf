terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.17.1" 
    }
  }
}

provider "vultr" {
  api_key = "SILLVA2A6J3F6S4SKKSNXAPFNZFMWNFF2MRA"
}

resource "vultr_instance" "lucaaaaas" {
  region  = "fra"
  plan    = "vc2-1c-1gb"
  os_id   = "352"

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker

              # Déploiement de MySQL
              sudo docker run -d \
                --name mysql-container \
                -e MYSQL_ROOT_PASSWORD=your-mysql-password \
                -e MYSQL_DATABASE=wordpress \
                -e MYSQL_USER=wordpress \
                -e MYSQL_PASSWORD=wordpress-password \
                mysql:latest

              # Déploiement de WordPress
              sudo docker run -d \
                --name wordpress-container \
                --link mysql-container:mysql \
                -p 80:80 \
                -e WORDPRESS_DB_HOST=mysql \
                -e WORDPRESS_DB_USER=wordpress \
                -e WORDPRESS_DB_PASSWORD=wordpress-password \
                -e WORDPRESS_DB_NAME=wordpress \
                wordpress:latest
            EOF
}

output "instance_ip" {
  value       = vultr_instance.lucaaaaas.main_ip
  description = "Adresse IP publique de la VM"
}
