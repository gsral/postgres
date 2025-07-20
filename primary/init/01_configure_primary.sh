#!/bin/bash
set -e

echo "Configuring primary PostgreSQL (PG_1)..."

echo "host replication all all md5" >> "$PGDATA/pg_hba.conf"
echo "wal_level = replica" >> "$PGDATA/postgresql.conf"
echo "max_wal_senders = 10" >> "$PGDATA/postgresql.conf"
echo "wal_keep_size = 64" >> "$PGDATA/postgresql.conf"
echo "hot_standby = on" >> "$PGDATA/postgresql.conf"

# Restart PostgreSQL to apply changes
pg_ctl -D "$PGDATA" -m fast -w restart

