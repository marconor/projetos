insert into ftrips (dropoff_datetime,dropoff_date,dropoff_latitude,dropoff_longitude,fare_amount,passenger_count,
                    pickup_datetime,pickup_date,pickup_latitude,pickup_longitude,rate_code,store_and_fwd_flag,
					surcharge,tip_amount,tolls_amount,total_amount,trip_distance,id_vendor,id_payment)
select cast(s.dropoff_datetime as datetime ),cast(s.dropoff_datetime as date),s.dropoff_latitude,s.dropoff_longitude,
            s.fare_amount,s.passenger_count,cast(pickup_datetime as datetime),cast(pickup_datetime as date),
			s.pickup_latitude,s.pickup_longitude,s.rate_code,s.store_and_fwd_flag,
			s.surcharge,s.tip_amount,s.tolls_amount,s.total_amount,s.trip_distance,v.id,p.id
			from stg_trips s
			inner join dim_vendor v on s.vendor_id = v.vendor_id
            inner join dim_payment p on s.payment_type = p.payment_type;	