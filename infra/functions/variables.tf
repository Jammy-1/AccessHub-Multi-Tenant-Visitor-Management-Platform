#General
variable "customer_name" { type = string }
variable "environment" { type = string }
variable "location" { type = string }

variable "resource_group_name" { type = string }

# Service
variable "storage_account_name" { type = string }
variable "storage_account_key" { type = string }
variable "cosmos_endpoint" { type = string }
variable "cosmos_key" { type = string }