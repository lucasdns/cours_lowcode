terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
    }
  }
}

resource "vultr_instance" "example" {
  plan        = "vc2-1c-1gb" 
  region      = "fra"      
  os_id       = "387"         
}