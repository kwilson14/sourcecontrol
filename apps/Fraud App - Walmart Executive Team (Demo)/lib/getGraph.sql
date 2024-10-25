WITH purchase AS (
    SELECT customer_id, SUM(total_price) as total_purchase, date(transaction_date) as purchase_date
    FROM walmart_nj_fraud_updated 
    WHERE transaction_type = 'Purchase' 
    GROUP BY customer_id, purchase_date
),
return AS (
    SELECT customer_id, SUM(total_price) as total_return, date(transaction_date) as return_date
    FROM walmart_nj_fraud_updated 
    WHERE transaction_type = 'Return' 
    GROUP BY customer_id, return_date
),
return_over_purchase AS (
    SELECT p.customer_id, (r.total_return - p.total_purchase) as return_over_purchase, r.return_date
    FROM purchase p 
    JOIN return r 
    ON p.customer_id = r.customer_id
    WHERE r.total_return > p.total_purchase
)
SELECT date(return_date) as transaction_date, return_over_purchase as damage FROM return_over_purchase;