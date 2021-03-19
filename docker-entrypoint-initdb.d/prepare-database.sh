#!/usr/bin/env bash
set -euo pipefail

# Run migrations.
#
# example:
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE EXTENSION IF NOT EXISTS hstore;
EOSQL
