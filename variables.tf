####NET CONFIGURATION

variable "vpc" {
  default     = "192.168.0.0/16"
  description = "Set VCN IP"
}

variable "public_subnet" {
  default     = "192.168.30.0/24"
  description = "Set Subnet Public"
}

variable "netprivate" {
  default     = "192.168.40.0/24"
  description = "Set subnet Private"
}

##INSTANCE CONFIGURATION

variable "instanceami" {
  default     = "ami-05fb0b8c1424f266b"
  description = "ID da ami"
}

variable "instancetype" {
  default     = "t2.micro"
  description = "Tipo da instancia"
}

variable "ingress" {
  type    = list(any)
  default = [22, 80, 443]

}

variable "cluster_name" {
  default = "NomedoClusterTeste"
}

variable "task_definition_family" {
  default = "my-task-def" # Nome da definição de tarefa ECS
}

variable "service_name" {
  default = "my-ecs-service" # Nome do serviço ECS
}














