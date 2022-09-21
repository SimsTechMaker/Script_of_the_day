rt#!/bin/bash

## install registry



echo "START - install registry - "


echo "[3]: install registry"
mkdir certs/
echo "[4]: creation de la cle rsa"
mkdir -p certs
 openssl req \  
  -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key \
  -addext "subjectAltName = DNS:jenkins-ob.com" \
  -x509 -days 365 -out certs/domain.crt
mkdir passwd/
echo "[5]: docker run "
docker run --entrypoint htpasswd registry:2 -Bbn sims theroot > passwd/htpasswd


echo "[6]: END docker run "
echo "
version: '3.5'
services:
  registry:
    restart: always
    image: registry:2
    container_name: registry
    ports:
      - 5000:5000
    environment:
      REGISTRY_HTTP_TLS_CERTIFICATE: /certs/myregistry.crt
      REGISTRY_HTTP_TLS_KEY: /certs/myregistry.key
      REGISTRY_AUTH: htpasswd
      REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
      REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
    volumes:
      - /mnt/usb1/data:/var/lib/registry
      - ./certs:/certs
      - ./passwd:/auth
" > docker-compose-registry.yml

docker-compose-registry.yml up -d

echo "END - install registry"

# Test
# docker login https://192.168.0.6:5000
