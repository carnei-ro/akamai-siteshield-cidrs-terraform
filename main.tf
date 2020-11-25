resource "null_resource" "api_call" {
  triggers = {
    NONCE     = uuid()
    TIMESTAMP = formatdate("YYYYMMDD'T'hh:mm:ssZZZZ", timestamp())
  }
  provisioner "local-exec" {
    command = <<EOT
        Authorization="EG1-HMAC-SHA256 client_token=$${CLIENT_TOKEN};access_token=$${ACCESS_TOKEN};timestamp=$${TIMESTAMP};nonce=$${NONCE};"
        signingKey=$(echo -en "$${TIMESTAMP}" | openssl dgst -binary -sha256 -hmac "$${CLIENT_SECRET}" | base64 )

        dataToHash="$${REQUEST_TYPE}\thttps\t$${HOST}\t$${REQUEST_PATH}\t\t\t$${Authorization}"
        hashedData=$(echo -en "$${dataToHash}" | openssl dgst -binary -sha256 -hmac "$${signingKey}" | base64)

        curl -sX"$${REQUEST_TYPE}" \
          "https://$${HOST}$${REQUEST_PATH}" \
          -H "Authorization: $${Authorization}signature=$${hashedData}" \
          -H "Content-Type: application/json" \
          --connect-timeout 5 \
          --max-time 10 \
          --retry 5 \
          --retry-delay 0 \
          --retry-max-time 40 | tee ${path.module}/akamai_output.json
    EOT
    environment = {
      CLIENT_SECRET = var.akamai_edgerc_client_secret
      CLIENT_TOKEN  = var.akamai_edgerc_client_token
      ACCESS_TOKEN  = var.akamai_edgerc_access_token
      HOST          = var.akamai_edgerc_host
      NONCE         = self.triggers.NONCE
      TIMESTAMP     = self.triggers.TIMESTAMP
      REQUEST_PATH  = "/siteshield/v1/maps/${var.akamai_site_shield_map_id}"
      REQUEST_TYPE  = "GET"
    }
  }
}

data "local_file" "akamai_siteshield_ouput" {
  filename   = "${path.module}/akamai_output.json"
  depends_on = [null_resource.api_call]
}
