variable "rg-name"{
    type = string
    default = "testing-1"
}
variable "vpc-name" {
     type = string
     default = "vasu-vpc"
     
}

variable "subnet-name" {
  type =string
  default = "vasu-subnet"
}
variable "vpc-cidr"{
    type = list
   default = []
}

variable "subnet-cidr"{
    type = list
   default = []
}
variable "public-ip-name"{
    type = string
}

variable "nic-name"{
    type = string
    default = "vasu-nic"
}

variable "vm-name"{
    type = string
    default = "vasu-vm"
  
}
variable "test" {
  type = bool
  default = true
  
}

variable "nsg-name"{
    type = string
    default = "vasu-nsg"
}

# variable "storage-account-name"{
#     type = string
#     default ={}
# }

# variable "container-name"{
#     type = string
#     default ={}
# }



                                                             








