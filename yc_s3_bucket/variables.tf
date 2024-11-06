variable "cloud_id" {
  description = "ID облака"
  type = string
}

variable "folder_id" {
  description = "ID каталога"
  type = string
}

variable "zone" {
  description = "ID зоны"
  type = string
  default = "ru-central1-a"
}

# variable "token" {
#   description = "Токен для доступа"
#   type = string
# }