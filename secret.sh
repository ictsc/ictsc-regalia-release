#!/bin/bash

jq -n \
  --arg discord_client_id "$DISCORD_CLIENT_ID" \
  --arg discord_client_secret "$DISCORD_CLIENT_SECRET" \
  --arg growi_api_token "$GROWI_API_TOKEN" \
'{
  apiVersion: "v1",
  kind: "Secret",
  metadata: {
    name: "scoreserver-secrets",
    namespace: "scoreserver",
  },
  data: {
    "discord-client-id": $discord_client_id | @base64,
    "discord-client-secret": $discord_client_secret | @base64,
    "growi-api-token": $growi_api_token | @base64,
  },
}'

jq -n \
  --arg cookie_secret "$OAUTH2_PROXY_COOKIE_SECRET" \
  --arg client_secret "$OAUTH2_PROXY_CLIENT_SECRET" \
'{
  apiVersion: "v1",
  kind: "Secret",
  metadata: {
    name: "oauth2-proxy-secret",
    namespace: "scoreserver",
  },
  data: {
    "cookie-secret": $cookie_secret | @base64,
    "client-secret": $client_secret | @base64,
  },
}'
