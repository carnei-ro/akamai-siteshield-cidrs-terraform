# Akamai SiteShield CIRDs - Terraform Module


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| local | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| akamai\_edgerc\_access\_token | Value from 'access\_token' field from Akamai EdgeRC file | `string` | n/a | yes |
| akamai\_edgerc\_client\_secret | Value from 'client\_secret' field from Akamai EdgeRC file | `string` | n/a | yes |
| akamai\_edgerc\_client\_token | Value from 'client\_token' field from Akamai EdgeRC file | `string` | n/a | yes |
| akamai\_edgerc\_host | Value from 'host' field from Akamai EdgeRC file | `string` | n/a | yes |
| akamai\_site\_shield\_map\_id | Stringified SiteShield map id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| akamai\_full\_object | Akamai /siteshield/v1/maps/{id} parsed response |
| akamai\_safe\_cidrs | Safe CIDRs to use on Security Groups - Proposed SiteShield CIRDs + SiteShield Current CIDRs |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
