#!/bin/sh

set -e
# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Load PostGIS into both template_database and $POSTGRES_DB
echo "Loading PgAgent extensions into $DB"
	psql --dbname="postgres" <<-'EOSQL'
		CREATE EXTENSION pgagent;
EOSQL

service pgagent start
