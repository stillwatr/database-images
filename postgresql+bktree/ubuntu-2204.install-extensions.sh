#!/bin/sh

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<EOF
create extension bktree;
select * FROM pg_extension;
EOF
