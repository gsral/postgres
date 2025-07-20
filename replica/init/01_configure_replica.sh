#!/bin/bash
set -e

echo "Configuring replica PostgreSQL (PG_2)..."

# Clean PGDATA
rm -rf "$PGDATA"/*

# Base backup from PG_1
pg_basebackup -h PG_1 -D "$PGDATA" -U postgres -Fp -Xs -P -R

# Add recovery configuration
echo "primary_conninfo = 'host=PG_1 port=5432 user=postgres password=postgres'" >> "$PGDATA/postgresql.auto.conf"

# Create standby.signal
touch "$PGDATA/standby.signal"

# Fix permissions
chown -R postgres:postgres "$PGDATA"

# Restart PostgreSQL to start as standby
pg_ctl -D "$PGDATA" -m fast -w restart

