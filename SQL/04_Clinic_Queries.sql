
SELECT * FROM clinics;
SELECT * FROM customer;
SELECT * FROM clinic_sales;
SELECT * FROM expenses;




-- Revenue for each sales channel (Given Year: 2021)
USE platinumrx_assignment;

SELECT 
    sales_channel,
    SUM(amount) AS revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;


-- Top 10 most valuable customers (2021)
SELECT 
    uid,
    SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;


-- Month-wise revenue, expense, profit & status (2021)
WITH revenue AS (
    SELECT 
        MONTH(datetime) AS month_no,
        SUM(amount) AS total_revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY month_no
),
expense AS (
    SELECT 
        MONTH(datetime) AS month_no,
        SUM(amount) AS total_expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY month_no
)
SELECT 
    r.month_no,
    r.total_revenue,
    e.total_expense,
    (r.total_revenue - e.total_expense) AS profit,
    CASE 
        WHEN (r.total_revenue - e.total_expense) >= 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM revenue r
LEFT JOIN expense e USING(month_no)
ORDER BY r.month_no;


-- For each city, most profitable clinic (Given Month Example: September)
WITH sales AS (
    SELECT
        cs.cid,
        c.city,
        EXTRACT(MONTH FROM cs.datetime) AS month_no,
        SUM(cs.amount) AS total_revenue
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    WHERE EXTRACT(MONTH FROM cs.datetime) = 9
    GROUP BY cs.cid, c.city, month_no
),
expense AS (
    SELECT
        e.cid,
        EXTRACT(MONTH FROM e.datetime) AS month_no,
        SUM(e.amount) AS total_expense
    FROM expenses e
    WHERE EXTRACT(MONTH FROM e.datetime) = 9
    GROUP BY e.cid, month_no
),
profit AS (
    SELECT
        s.cid,
        s.city,
        s.month_no,
        (s.total_revenue - COALESCE(e.total_expense, 0)) AS clinic_profit
    FROM sales s
    LEFT JOIN expense e
        ON s.cid = e.cid AND s.month_no = e.month_no
),
ranked AS (
    SELECT
        cid,
        city,
        month_no,
        clinic_profit,
        RANK() OVER (PARTITION BY city ORDER BY clinic_profit DESC) AS rnk
    FROM profit
)
SELECT city, cid, clinic_profit
FROM ranked
WHERE rnk = 1;



-- For each state, second least profitable clinic (Given Month Example: September)
WITH sales AS (
    SELECT
        cs.cid,
        c.state,
        EXTRACT(MONTH FROM cs.datetime) AS month_no,
        SUM(cs.amount) AS total_revenue
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    WHERE EXTRACT(MONTH FROM cs.datetime) = 9
    GROUP BY cs.cid, c.state, month_no
),
expense AS (
    SELECT
        e.cid,
        EXTRACT(MONTH FROM e.datetime) AS month_no,
        SUM(e.amount) AS total_expense
    FROM expenses e
    WHERE EXTRACT(MONTH FROM e.datetime) = 9
    GROUP BY e.cid, month_no
),
profit AS (
    SELECT
        s.cid,
        s.state,
        s.month_no,
        (s.total_revenue - COALESCE(e.total_expense, 0)) AS clinic_profit
    FROM sales s
    LEFT JOIN expense e
        ON s.cid = e.cid AND s.month_no = e.month_no
),
ranked AS (
    SELECT
        cid,
        state,
        month_no,
        clinic_profit,
        RANK() OVER (PARTITION BY state ORDER BY clinic_profit ASC) AS rnk
    FROM profit
)
SELECT state, cid, clinic_profit
FROM ranked
WHERE rnk = 2;
