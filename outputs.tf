output "akamai_full_object" {
  description = "Akamai /siteshield/v1/maps/{id} parsed response"
  value       = jsondecode(data.local_file.akamai_siteshield_ouput.content)
}

output "akamai_safe_cidrs" {
  description = "Safe CIDRs to use on Security Groups - Proposed SiteShield CIRDs + SiteShield Current CIDRs"
  value = distinct(
    concat(
      lookup(
        jsondecode(data.local_file.akamai_siteshield_ouput.content), "proposedCidrs", []
      ),
      lookup(
        jsondecode(data.local_file.akamai_siteshield_ouput.content), "currentCidrs", []
      )
    )
  )
}
