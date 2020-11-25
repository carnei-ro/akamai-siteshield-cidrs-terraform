variable "akamai_edgerc_client_secret" {
  description = "Value from 'client_secret' field from Akamai EdgeRC file"
  type        = string
}
variable "akamai_edgerc_client_token" {
  description = "Value from 'client_token' field from Akamai EdgeRC file"
  type        = string
}
variable "akamai_edgerc_access_token" {
  description = "Value from 'access_token' field from Akamai EdgeRC file"
  type        = string
}
variable "akamai_edgerc_host" {
  description = "Value from 'host' field from Akamai EdgeRC file"
  type        = string
}
variable "akamai_site_shield_map_id" {
  description = "Stringified SiteShield map id"
  type        = string
}
