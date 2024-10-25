WITH purchase AS (
    SELECT customer_id, SUM(total_price) as total_purchase 
    FROM walmart_nj_fraud_updated 
    WHERE transaction_type = 'Purchase' 
    GROUP BY customer_id
),
return AS (
    SELECT customer_id, SUM(total_price) as total_return 
    FROM walmart_nj_fraud_updated 
    WHERE transaction_type = 'Return' 
    GROUP BY customer_id
),
return_over_purchase AS (
    SELECT p.customer_id, (r.total_return - p.total_purchase) as return_over_purchase
    FROM purchase p 
    JOIN return r 
    ON p.customer_id = r.customer_id
    WHERE r.total_return > p.total_purchase
)
SELECT SUM(return_over_purchase) as total_return_over_purchase FROM return_over_purchase;