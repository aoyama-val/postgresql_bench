#vim: set ts=2 sts=2 sw=2 et:

require "bundler/setup"
require "pg"

if ARGV.length == 0
  puts "Usage: #{$0} dbhost"
  exit(1)
else
  dbhost = ARGV[0]
end

pid = Process.pid
started_at = Time.now

bus_code = "01_marunouchi_1"
positioning_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
latitude = 35.5
longitude = 139.5
altitude = 0
course = 0
speed = 0
created_at = positioning_time
updated_at = positioning_time
dropped = 1
percentage = 50
olat = 35.6
olng= 139.6
x = 1
y = 2
battery_percent = 20
battery_status = "Charging"
battery_source = "Usb"
route_id = 2
count_sensor = "on"
accuracy = 84

db = PG::connect(:host => dbhost, :user => "postgres", :dbname => "postgres", password: "dftl0934")

if false
  puts "同期コミット on"
else
  puts "同期コミット off"
  db.exec("SET synchronous_commit TO OFF")
end

counter = 0
puts "#{pid}: Start: #{started_at.to_f}"
while Time.now - started_at < 1.0
  db.exec_params("INSERT INTO bus_locations (bus_code, positioning_time, latitude, longitude, altitude, course, speed, created_at, updated_at, dropped, percentage, olat, olng, x, y, battery_percent, battery_status, battery_source, route_id, count_sensor, accuracy) VALUES ($1, $2, $3 ,$4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21)", [
  bus_code,
  positioning_time,
  latitude,
  longitude,
  altitude,
  course,
  speed,
  created_at,
  updated_at,
  dropped,
  percentage,
  olat,
  olng,
  x,
  y,
  battery_percent,
  battery_status,
  battery_source,
  route_id,
  count_sensor,
  accuracy,
  ])
counter += 1
end
puts "#{pid}: End: #{Time.now.to_f}:              #{counter} rows inserted"
