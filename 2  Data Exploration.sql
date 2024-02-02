

--The nulls values of each column are shown below.

SELECT
 SUM(CASE WHEN ride_id is null then 1 else 0 end) AS ride_id, 
 SUM(CASE WHEN rideable_type is null then 1 else 0 end) AS rideabel_type,
 SUM(CASE WHEN started_at is null then 1 else 0 end) AS started_at,
 SUM(CASE WHEN ended_at is null then 1 else 0 end) AS ended_at,
 SUM(CASE WHEN start_station_name is null then 1 else 0 end) AS start_station_name,
 SUM(CASE WHEN start_station_id is null then 1 else 0 end) AS start_station_id,
 SUM(CASE WHEN end_station_name is null then 1 else 0 end) AS end_station_name,
 SUM(CASE WHEN end_station_id is null then 1 else 0 end) AS end_station_id,
 SUM(CASE WHEN start_lat is null then 1 else 0 end) AS start_lat,
 SUM(CASE WHEN start_lng is null then 1 else 0 end) AS start_lng,
 SUM(CASE WHEN end_lat is null then 1 else 0 end) AS end_lat,
 SUM(CASE WHEN end_lng is null then 1 else 0 end) AS end_lng,
 SUM(CASE WHEN member_casual is null then 1 else 0 end) AS member_casual
FROM `natural-bus-410617.Cyclist.Trips_2023` ;


--Checking duplicate values in the table.

SELECT COUNT(ride_id) - COUNT(distinct ride_id) AS duplicates
FROM `natural-bus-410617.Cyclist.Trips_2023` 


--Check all the ride id is consisted of 16 lengths.

SELECT LENGTH(ride_id) AS leng_ride_id
FROM `natural-bus-410617.Cyclist.Trips_2023` 
GROUP BY leng_ride_id


--Check the different types of bikes and their numbers.

SELECT DISTINCT rideable_type AS bike_types,
 COUNT(rideable_type) AS number_of_bikes
FROM `natural-bus-410617.Cyclist.Trips_2023` 
GROUP BY bike_types


--Checking how many rows do not have entries for each start station name or start station id or both.

SELECT COUNT(CASE WHEN start_station_name is null then 1 end) AS null_start_station_name,
COUNT(CASE WHEN start_station_id is null then 1 end) AS null_start_station_id,
COUNT(CASE WHEN start_station_name is null or start_station_id is null then 1 end) AS null_either
FROM `natural-bus-410617.Cyclist.Trips_2023` 


--Same process for the end station entries.

SELECT COUNT(CASE WHEN end_station_name is null then 1 end) AS null_end_station_name,
COUNT(CASE WHEN end_station_id is null then 1 end) AS null_end_station_id,
COUNT(CASE WHEN end_station_name is null or end_station_id is null then 1 end) AS null_either
FROM `natural-bus-410617.Cyclist.Trips_2023` 


--Checking missing entries for start and end of latitude and longitude.

SELECT COUNT(CASE WHEN start_lat is null then 1 end) AS null_start_lat,
COUNT(CASE WHEN start_lng is null then 1 end) AS null_start_lng,
COUNT(CASE WHEN end_lat is null then 1 end) AS null_end_lat,
COUNT(CASE WHEN end_lng is null then 1 end) AS null_end_lng
FROM `natural-bus-410617.Cyclist.Trips_2023` 


--Check the types of memberships and their number of members.

SELECT DISTINCT(member_casual) AS membership_types,
COUNT(member_casual) AS numbers_of_members
FROM `natural-bus-410617.Cyclist.Trips_2023` 
GROUP BY membership_types
