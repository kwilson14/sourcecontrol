SELECT
    ((total_count - count_since_specific_date) / CAST(total_count AS FLOAT) * 100) AS Percent_Difference
FROM
    (SELECT 
        (SELECT COUNT(DISTINCT customer_id) AS total_count
        FROM 
            (SELECT r.customer_id 
            FROM walmart_nj_fraud_updated r
            FULL JOIN walmart_nj_fraud_updated p ON r.customer_id = p.customer_id
            WHERE r.transaction_type = 'Return' 
            AND p.transaction_type = 'Purchase'
            AND r.total_price > p.total_price) AS all_transactions),
             
        (SELECT COUNT(DISTINCT customer_id) AS count_since_specific_date
        FROM 
            (SELECT r.customer_id 
            FROM walmart_nj_fraud_updated r
            FULL JOIN walmart_nj_fraud_updated p ON r.customer_id = p.customer_id
            WHERE r.transaction_type = 'Return' 
            AND p.transaction_type = 'Purchase'
            AND r.transaction_date >= '2024-03-06'
            AND r.total_price > p.total_price) AS transactions_since_date) 
    ) AS Counts;