#!/bin/bash

## install server postgres



echo "START - install postgres - "

echo "[1]: update"
apt-get update -qq >/dev/null
echo "[2]: install postgres"
apt-get install -qq -y postgresql-11 >/dev/null
echo "[3]: configuration de la base de doneé"
sudo -u postgres bash -c "psql -c \"CREATE USER sims WITH PASSWORD 'theroot';\""
sudo -u postgres bash -c "psql -c \"CREATE DATABASE dev OWNER sims;\""
sudo -u postgres bash -c "psql -c \"CREATE DATABASE stage OWNER sims;\""
sudo -u postgres bash -c "psql -c \"CREATE DATABASE prod OWNER sims;\""
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/11/main/postgresql.conf
sed -i "s/127.0.0.1\/32/0.0.0.0\/0/g" /etc/postgresql/11/main/pg_hba.conf
service postgresql restart

echo "[4]: user = sims and password = theroot"
echo "END - install postgres"


