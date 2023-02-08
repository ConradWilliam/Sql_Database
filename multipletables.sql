--@BLOCK
SELECT *
FROM orders
LIMIT 10;
 
SELECT *
FROM subscriptions
LIMIT 10;

SELECT * 
FROM orders 
JOIN subscriptions 
ON orders.subscription_id = subscriptions.subscription_id;

SELECT * 
FROM orders
JOIN subscriptions 
ON orders.subscription_id = subscriptions.subscription_id
WHERE description = 'Fashion Magazine' ;

--@BLOCK
SELECT * FROM newspaper LEFT JOIN online ON newspaper.id = online.id;

SELECT * FROM newspaper LEFT JOIN online ON newspaper.id = online.id WHERE online.id IS NULL;

--@BLOCK
SELECT * FROM classes INNER JOIN students ON classes.id = students.class_id;

--@BLOCK
SELECT COUNT(*) FROM newspaper WHERE start_month <= 3 AND end_month >= 3;

SELECT * FROM newspaper CROSS JOIN months;

SELECT * FROM newspaper CROSS JOIN months WHERE start_month <= month AND end_month >= month;

SELECT month,
  COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month AND end_month >= month
GROUP BY 1;

--@BLOCK
SELECT * FROM newspaper 
UNION 
SELECT * FROM online;

--@BLOCK
WITH previous_query AS (
   SELECT customer_id,
      COUNT(subscription_id) AS 'subscriptions'
   FROM orders
   GROUP BY customer_id
)
SELECT customers.customer_name, 
   previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;