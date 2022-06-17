//Variáveis das Imagens

variable "amis" {
    type = map

    default = {
        "us-east-1" = "endereço da imagem"
        "us-east-2" = "endereço da imagem"
    }
  
}

//Variáveis de IP's Remotos de Acesso

variable "cidrs_acesso_remoto" {
    type = list
    
    default = ["IP da máquina local"]
  
}

//Variáveis de SSH

variable "key_name" {
    default = "Nome do arquivo ssh público"  
  
}