
--Creating new table with cleaned data

with trips_table as (
   select ride_id, rideable_type, started_at, ended_at,(EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
      EXTRACT(MINUTE FROM (ended_at - started_at)) +
      EXTRACT(SECOND FROM (ended_at - started_at)) / 60) as ride_length,
 CASE EXTRACT(DAYOFWEEK FROM started_at) 
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUES'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'    
    END AS day_of_week,
     CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
     start_station_name, end_station_name, 
    start_lat, start_lng, end_lat, end_lng, member_casual
    from `natural-bus-410617.Cyclist.Trips_2023`
    WHERE 
    start_station_id IS NOT NULL AND
    end_station_id IS NOT NULL AND
    end_lat IS NOT NULL AND
    end_lng IS NOT NULL 
)

--filter out the trips that has less than 1 minute or more than a day of travel length. 
  select * 
  from trips_table 
  where  1 < ride_length and ride_length < 1440
  
--check the final table's number of rows
select count(*)
from `natural-bus-410617.Cyclist.trips_table_cleaned`

 
