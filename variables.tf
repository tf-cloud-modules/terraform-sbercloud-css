variable "create" {
  description = "Controls if resources should be created."
  type        = bool
  default     = true
}

variable "region" {
  description = "The region in which to create the cluster resource."
  type        = string
  default     = null
}

variable "name" {
  description = "Cluster name."
  type        = string
}

variable "engine_type" {
  description = "Engine type."
  type        = string
  default     = null
}

variable "engine_version" {
  description = "Engine version."
  type        = string
}

variable "expect_node_num" {
  description = "Number of cluster instances."
  type        = string
  default     = null
}

variable "security_mode" {
  description = "Whether to enable communication encryption and security authentication."
  type        = bool
  default     = null
}

variable "password" {
  description = "Password of the cluster administrator admin in security mode."
  type        = string
  sensitive   = true
  default     = null
}

variable "node_config" {
  description = "Node configuration."
  type        = list(any)
}

variable "backup_strategy" {
  description = "Specifies the advanced backup policy."
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "The key/value pairs to associate with the cluster."
  type        = map(string)
  default     = {}
}