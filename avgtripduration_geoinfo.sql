#This query is to rank the Citibike stations by average trip duration. I used the start_station_name to as the station name and used the trip_duration field instead of computing the duration using the starttime and endtime fields. Because the tripduration field is in seconds, i divided by 60 to get the duration in mins.

WITH

dataset AS (
SELECT
  *
FROM 
  citibike.citibike2021
WHERE
  start_station_name IS NOT null

) 
SELECT
  start_station_name,
  ROUND((AVG(trip_duration)/60),2) AS average_trip_duration,
  start_station_latitude,
  start_station_longitude
FROM
  dataset
GROUP BY start_station_name
ORDER BY average_trip_duration DESC