
--bike types by users
select member_casual, rideable_type, count(*) as total_trips
from `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by member_casual, rideable_type
order by member_casual, total_trips desc

---average and maximum duration of ride by days 
SELECT 
 day_of_week,
avg(ride_length) as average_ride_length,
max(ride_length) as max_ride,
count(day_of_week) as daily_users
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by day_of_week
order by daily_users desc; 

--number of  trips per month by user types
select month, member_casual, count(ride_id) as total_trips
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by month, member_casual
order by member_casual desc;

--number of trips per day of week by user types 
select day_of_week, member_casual, count(ride_id) as total_trips
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by day_of_week, member_casual
order by member_casual desc;

--number of trips per hour by user types 
select extract(hour from started_at) as hour, member_casual, count(ride_id) as total_trips
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by hour, member_casual
order by member_casual, total_trips;

--average ride length per month
select month, member_casual, avg(ride_length) as average_time
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by month, member_casual
order by member_casual;

--average ride length per day
select day_of_week, member_casual, avg(ride_length) as average_time
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by day_of_week, member_casual
order by member_casual;

--average ride length per hour
select extract(hour from started_at) as hour, member_casual, avg(ride_length) as average_time
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by hour, member_casual
order by member_casual, total_trips

--frequency of starting stations
select start_station_name, member_casual, avg(start_lat) as start_lat, avg(start_lng) as start_lng, count(ride_id) as start_journey
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by start_station_name, member_casual
order by member_casual, start_journey DESC

   /*average for start_lat and start_lng is done for the case where one station has different round position on decinal value which will not affect the actual geographic information
   Latitude and Longitude will be used later in data visualisation*/

--frequency of ending stations

select end_station_name, avg(end_lat), avg(end_lng), member_casual, count(ride_id) as end_journey
FROM `natural-bus-410617.Cyclist.trips_table_cleaned` 
group by end_station_name, member_casual
order by member_casual, end_journey DESC;

