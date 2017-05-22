#!/bin/bash

set -e

DB="$1"

if [ "$DB" = "" ]; then
  echo "Usage: start.sh dbhost"
  exit 1
fi

psql --host "$DB" -c "TRUNCATE TABLE bus_locations"

for i in {1..36}; do
  ruby a.rb "$DB" &
done


wait
psql -c "SELECT count(*) FROM bus_locations" --host "$DB"
