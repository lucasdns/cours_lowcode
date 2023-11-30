import sys
import os

def update_tfvars(num_instances):
    with open("terraform.tfvars", "w") as f:
        f.write(f"num_instances = {num_instances}\n")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python cli.py [nombre_d_instances]")
        sys.exit(1)

    num_instances = int(sys.argv[1])

    # Met à jour le fichier terraform.tfvars
    update_tfvars(num_instances)

    # Exécute Terraform pour déployer les instances
    os.system("terraform apply")
