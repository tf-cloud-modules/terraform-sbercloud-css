output "id" {
  description = "Specifies a resource ID in UUID format."
  value       = try(sbercloud_css_cluster.this[0].id, "")
}

output "endpoint" {
  description = "Indicates the IP address and port number."
  value       = try(sbercloud_css_cluster.this[0].endpoint, "")
}

output "password" {
  description = "Password of the cluster administrator admin in security mode."
  sensitive   = true
  value       = try(var.password, "")
}