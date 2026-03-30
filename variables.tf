variable "location" {
  description = "Región de Azure donde se desplegarán los recursos"
  type        = string
  default     = "East US"
}

variable "hub_prefix" {
  description = "Rango de red para el HUB"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "spoke_prefix" {
  description = "Rango de red para el SPOKE"
  type        = list(string)
  default     = ["10.1.0.0/16"]
}
