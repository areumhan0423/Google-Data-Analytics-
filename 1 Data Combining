-- Data Combining

-- combining 12 months of data tables of 2023 into one compiled table.

CREATE TABLE `Trips_2023` AS (
  SELECT * FROM `Trip_Data_2023_Jan`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Feb`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Mar`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Apr`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_May`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Jun`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Jul`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Aug`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Sep`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Oct`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Nov`
  UNION ALL
  SELECT * FROM `Trip_Data_2023_Dec`
);

-- checking number of rows of unioned table corresponds to the sum of each table's row - which is 5,719,877

SELECT COUNT(*)
FROM `natural-bus-410617.Cyclist.ry_Trips_2023`;

--The result matches with the sum of rows. 
