provider "github" {
  token = "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"
}

variable "nom_du_repo" {
  description = "Nom du dépôt GitHub"
  type        = string
}

resource "github_repository" "mon_repo" {
  name        = var.nom_du_repo
  description = "Créé avec Terraform2"
  private     = true
}