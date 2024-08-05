#!/bin/sh
echo "Iniciando healthcheck..." >&2
sleep 2
export VAULT_ADDR=http://vault:8200

if vault kv metadata get -mount=secret emacommerce; then
  echo "Healthcheck passed" >&2
  exit 0
else
  echo "Healthcheck failed" >&2
  exit 1
fi

echo "Fin healthcheck"