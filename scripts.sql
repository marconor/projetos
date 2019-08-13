CREATE TABLE dim_calendar AS
SELECT
 date_gen.dt AS "date",
 DATE_PART('y', date_gen.dt)::smallint AS "year",
 DATE_PART('mon', date_gen.dt)::smallint AS "month",
 DATE_PART('day', date_gen.dt)::smallint AS "day",
 DATE_PART('qtr', date_gen.dt)::smallint AS "quarter",
 DATE_PART('w', date_gen.dt)::smallint AS "week",
 CASE DATE_PART('dow', date_gen.dt)
  WHEN 0 THEN 'Sunday'
  WHEN 1 THEN 'Monday'
  WHEN 2 THEN 'Tuesday'
  WHEN 3 THEN 'Wednesday'
  WHEN 4 THEN 'Thursday'
  WHEN 5 THEN 'Friday'
  WHEN 6 THEN 'Saturday'
 END::VARCHAR(9) AS "day_name",
 CASE DATE_PART('mon', date_gen.dt)::smallint
  WHEN 1 THEN 'January'
  WHEN 2 THEN 'February'
  WHEN 3 THEN 'March'
  WHEN 4 THEN 'April'
  WHEN 5 THEN 'May'
  WHEN 6 THEN 'June'
  WHEN 7 THEN 'July'
  WHEN 8 THEN 'August'
  WHEN 9 THEN 'September'
  WHEN 10 THEN 'October'
  WHEN 11 THEN 'November'
  WHEN 12 THEN 'December'
 END::VARCHAR(9) AS "month_name"
FROM
(SELECT 
    ('2020-01-01' - n)::date AS dt FROM (SELECT row_number() over () AS n FROM stl_scan LIMIT 54787)) date_gen;		

CREATE TABLE dim_vendor (id  bigint identity(1, 1),
  vendor_id VARCHAR(100) NULL,
  name VARCHAR(100) NULL,
  address VARCHAR(100) NULL,
  city VARCHAR(100) NULL,
  state VARCHAR(100) NULL,
  zip VARCHAR(100) NULL,
  country VARCHAR(100) NULL,
  contact VARCHAR(100) NULL,
  current VARCHAR(100) NULL,
  PRIMARY KEY (id));
  
  
 CREATE TABLE dim_payment (id  bigint identity(1, 1),
  payment_lookup VARCHAR(100) NULL,
  payment_type(100) NULL,
 PRIMARY KEY (id)); 
  
  
	
	
CREATE TABLE stg_trips (
    dropoff_datetime timestamp default NULL,
    dropoff_latitude numeric default NULL,
    dropoff_longitude numeric default NULL,
    fare_amount numeric  NULL,
    passenger_count numeric NULL,
    payment_type Varchar(100) NULL,
    pickup_datetime timestamp default NULL,
    pickup_latitude numeric NULL,
    pickup_longitude numeric NULL,
    rate_code varchar(100) NULL,
    store_and_fwd_flag varchar(100) NULL,
    surcharge numeric NULL,
    tip_amount numeric NULL,
    tolls_amount numeric NULL,
    total_amount numeric NULL,
    trip_distance numeric NULL,
    vendor_id varchar(100)
);

	

CREATE TABLE ftrips (
    dropoff_datetime datetime NULL,
	dropoff_date date NULL,
    dropoff_latitude Varchar(100)  NULL,
    dropoff_longitude Varchar(100) NULL,
    fare_amount decimal(10,3)  NULL,
    passenger_count numeric NULL,
    pickup_datetime datetime default NULL,
	pickup_date date NULL,
    pickup_latitude Varchar(100) NULL,
    pickup_longitude Varchar(100) NULL,
    rate_code varchar(100) NULL,
    store_and_fwd_flag varchar(100) NULL,
    surcharge decimal(10,3) NULL,
    tip_amount decimal(10,3) NULL,
    tolls_amount decimal(10,3) NULL,
    total_amount decimal(10,3) NULL,
    trip_distance decimal(10,3) NULL,
    id_vendor integer NOT NULL,
	id_payment integer NOT NULL
);

	