#!/bin/sh

# CREATE DATABASE actually works by copying the existing database "template1".
# Install bktree in this database, so this extension is available from all databases.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "template1" <<EOF
create extension bktree;
select * FROM pg_extension;
EOF