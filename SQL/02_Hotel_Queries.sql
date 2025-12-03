-- SELECT * FROM users;
-- SELECT * FROM items;
-- SELECT * FROM bookings;
-- SELECT * FROM booking_commercials;





-- For every user, get user_id and last booked room_no
SELECT 
    u.user_id,
    b.room_no
FROM users u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_date = (
    SELECT MAX(b2.booking_date)
    FROM bookings b2
    WHERE b2.user_id = u.user_id
);


-- booking_id and total billing amount created in November 2021
SELECT 
    b.booking_id,
    SUM(i.item_rate * bc.item_quantity) AS total_amount
FROM bookings b
JOIN booking_commercials bc ON b.booking_id = bc.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(b.booking_date) = 11
  AND YEAR(b.booking_date) = 2021
GROUP BY b.booking_id;

-- bill_id and bill amount for bills > 1000 in October 2021
SELECT 
    bc.bill_id,
    SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING bill_amount > 1000;

-- Most & least ordered item of each month (2021)
WITH monthly_items AS (
    SELECT 
        MONTH(bc.bill_date) AS month_no,
        bc.item_id,
        SUM(bc.item_quantity) AS total_qty,
        RANK() OVER (PARTITION BY MONTH(bc.bill_date) ORDER BY SUM(bc.item_quantity) DESC) AS rnk_desc,
        RANK() OVER (PARTITION BY MONTH(bc.bill_date) ORDER BY SUM(bc.item_quantity) ASC) AS rnk_asc
    FROM booking_commercials bc
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY month_no, bc.item_id
)
SELECT 
    month_no,
    item_id,
    total_qty,
    CASE 
        WHEN rnk_desc = 1 THEN 'Most Ordered'
        WHEN rnk_asc = 1 THEN 'Least Ordered'
    END AS order_type
FROM monthly_items
WHERE rnk_desc = 1 OR rnk_asc = 1
ORDER BY month_no;


-- Customers with the second highest bill value of each month
WITH monthly_bills AS (
    SELECT 
        EXTRACT(MONTH FROM bc.bill_date) AS month_no,
        bc.bill_id,
        SUM(i.item_rate * bc.item_quantity) AS bill_amount,
        RANK() OVER (
            PARTITION BY EXTRACT(MONTH FROM bc.bill_date)
            ORDER BY SUM(i.item_rate * bc.item_quantity) DESC
        ) AS bill_rank
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY month_no, bc.bill_id
)
SELECT month_no, bill_id, bill_amount
FROM monthly_bills
WHERE bill_rank = 2
ORDER BY month_no;
