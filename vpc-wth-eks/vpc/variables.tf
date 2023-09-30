variable "availability_zones" {
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  type        = list
  description = "AZs we want to use"
}

