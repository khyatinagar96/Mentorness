use hotelreservation;

SELECT Count(*) FROM `hotel reservation dataset`;

select type_of_meal_plan, count(*) as no_of_meals from `hotel reservation dataset`
group by type_of_meal_plan
order by no_of_meals
limit 1 ;

SELECT avg(avg_price_per_room) AS average_price_per_room_with_children
FROM `hotel reservation dataset`
WHERE no_of_children > 0;

select count(*) as no_of_reservations  from `hotel reservation dataset`
where year(str_to_date(arrival_date,'%y-%m-%d %T') ) = 2018 ;

SELECT room_type_reserved, COUNT(*) AS total_bookings
FROM `hotel reservation dataset`
GROUP BY room_type_reserved
ORDER BY total_bookings DESC
LIMIT 1;

SELECT COUNT(*) AS no_of_weekend_nights
FROM `hotel reservation dataset`
WHERE no_of_weekend_nights > 0;

SELECT 
    MAX(lead_time) AS highest_lead_time,
    MIN(lead_time) AS lowest_lead_time
FROM `hotel reservation dataset`;

SELECT market_segment_type, COUNT(*) AS segment_count
FROM `hotel reservation dataset`
GROUP BY market_segment_type
ORDER BY segment_count DESC
LIMIT 1;

SELECT COUNT(*) AS confirmed_reservations
FROM `hotel reservation dataset`
WHERE booking_status = 'Confirmed';

SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM `hotel reservation dataset`;

SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children
FROM `hotel reservation dataset`
WHERE no_of_children > 0;

SELECT month(str_to_date(arrival_date,'%y-%m-%d %T') ) AS reservation_month,
       COUNT(*) AS reservations_count
FROM `hotel reservation dataset`
GROUP BY reservation_month
order by reservation_month;

SELECT room_type_reserved,
       AVG(total_nights) AS avg_nights_per_room_type
FROM (
    SELECT room_type_reserved,
           SUM(no_of_weekend_nights + no_of_week_nights) AS total_nights
    FROM `hotel reservation dataset`
    GROUP BY room_type_reserved
) AS subquery
GROUP BY room_type_reserved;

SELECT room_type_reserved, AVG(avg_price_per_room) AS average_price
FROM `hotel reservation dataset`
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT market_segment_type, AVG(avg_price_per_room) AS average_price_per_room
FROM `hotel reservation dataset`
GROUP BY market_segment_type
ORDER BY average_price_per_room DESC
LIMIT 1;






