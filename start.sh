#!/bin/sh

psql -c "TRUNCATE TABLE bus_locations"

ruby a.rb &
ruby a.rb &

sleep 2

psql -c "SELECT count(*) FROM bus_locations"
