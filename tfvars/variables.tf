variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = true
    }
}

variable "instance_name" {
    
}

variable "instance_names" {
    default = ["mysql", "backend", "frontend"]
}
variable "hosted_zone" {
    default = "Z0349801RON7VAQ0OKJF"
}

variable "domain_name" {
    default = "narne.shop"
}

variable "tags" {

}

variable "environment" {
    
}