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

              # Clonez le dépôt
              git clone https://github.com/votre-utilisateur/cours_lowcode.git
              cd cours_lowcode

              # Construisez l'image Docker
              sudo docker build -t votre-image-docker .

              # Lancez l'application Docker
              sudo docker run -d -p 80:80 --name mon-app-docker votre-image-docker
            EOF
}
