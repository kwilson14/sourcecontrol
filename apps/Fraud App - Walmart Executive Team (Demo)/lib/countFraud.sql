SELECT COUNT(DISTINCT customer_id) As fraudulent_customers
FROM 
    (SELECT r.customer_id 
    FROM walmart_nj_fraud_updated r
    FULL JOIN walmart_nj_fraud_updated p ON r.customer_id = p.customer_id
    WHERE r.transaction_type = 'Return' 
    AND p.transaction_type = 'Purchase'
    AND r.total_price > p.total_price) As fraudulent_transactions;