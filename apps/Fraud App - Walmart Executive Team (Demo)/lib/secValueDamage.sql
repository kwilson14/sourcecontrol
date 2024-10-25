SELECT
    ((total_sum_price - sum_price_since_specific_date) / CAST(total_sum_price AS FLOAT) * 100) AS Percent_Difference
FROM
    (SELECT 
        (SELECT SUM(total_price) AS total_sum_price
        FROM 
            (SELECT r.total_price 
            FROM walmart_nj_fraud_updated r
            FULL JOIN walmart_nj_fraud_updated p ON r.customer_id = p.customer_id
            WHERE r.transaction_type = 'Return' 
            AND p.transaction_type = 'Purchase'
            AND r.total_price > p.total_price) AS all_transactions),
             
        (SELECT SUM(total_price) AS sum_price_since_specific_date
        FROM 
            (SELECT r.total_price  
            FROM walmart_nj_fraud_updated r
            FULL JOIN walmart_nj_fraud_updated p ON r.customer_id = p.customer_id
            WHERE r.transaction_type = 'Return' 
            AND p.transaction_type = 'Purchase'
            AND r.transaction_date >= '2024-03-07'
            AND r.total_price > p.total_price) AS transactions_since_date) 
    ) AS Counts;