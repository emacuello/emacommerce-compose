#!/bin/sh

export VAULT_ADDR="http://localhost:8200"

vault login token=${VAULT_DEV_ROOT_TOKEN_ID}

vault kv put -mount=secret emacommerce @/usr/local/bin/env-vault.json

echo "Secrets put correctly"
