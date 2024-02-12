
-- External table
SELECT COUNT(DISTINCT PULocationID) FROM `dtc-de-course-412904.ny_taxi.green_2022_cab_data_external`


SELECT COUNT(1) FROM `dtc-de-course-412904.ny_taxi.green_2022_cab_data_external` where fare_amount=0;

CREATE OR REPLACE TABLE `dtc-de-course-412904.ny_taxi.green_2022_cab_data_external_partitioned_clustered`
PARTITION BY DATE(lpep_dropoff_date)
CLUSTER BY PULocationID AS
SELECT * FROM `dtc-de-course-412904.ny_taxi.green_2022_cab_data_external`;

SELECT count(0) from `dtc-de-course-412904.ny_taxi.green_2022_cab_data_external` 

-- Materialized BQ table

SELECT COUNT(1) FROM `dtc-de-course-412904.ny_taxi.green_2022_cab_data` where fare_amount = 0 

CREATE OR REPLACE TABLE `dtc-de-course-412904.ny_taxi.green_2022_cab_data_partitioned_clustered`
PARTITION BY lpep_pickup_date
CLUSTER BY PULocationID AS
SELECT * FROM `dtc-de-course-412904.ny_taxi.green_2022_cab_data`;

SELECT COUNT(DISTINCT PULocationID) FROM `dtc-de-course-412904.ny_taxi.green_2022_cab_data_partitioned_clustered` 
WHERE lpep_pickup_date BETWEEN '2022-06-01' AND '2022-06-30'

SELECT count(*) from `dtc-de-course-412904.ny_taxi.green_2022_cab_data`