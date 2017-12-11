#!/usr/bin/env bash


if [ -z ${VAULT_TOKEN} ]; then
  error "Missing VAULT_TOKEN"
  exit 1;
fi

if [ -z ${VAULT_ADDR} ]; then
  warn "Missing VAULT_ADDRESS - using DNS 'vaultserver:8200'"
  export VAULT_ADDRESS='vaultserver:8200'
fi
VAULT_HOST=$(echo $VAULT_ADDR | cut -d':' -f1)
VAULT_PORT=$(echo $VAULT_ADDR | cut -d':' -f2)

echo "host: ${VAULT_HOST}
port: ${VAULT_PORT}
token: ${VAULT_HOST}
auth_backend: token
auth_method: token
tls: false
verify_tls: false" >  ~/.vaultrc
chmod 600 ~/.vaultrc
