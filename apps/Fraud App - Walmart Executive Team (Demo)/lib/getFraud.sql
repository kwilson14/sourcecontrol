SELECT *
FROM walmart_nj_fraud_updated
WHERE customer_id IN (
    SELECT customer_id
    FROM walmart_nj_fraud_updated
    WHERE transaction_type = 'Return'
)
AND customer_id IN (
    SELECT customer_id
    FROM walmart_nj_fraud_updated
    WHERE transaction_type = 'Purchase'
)
AND ({{ select1.selectedLabel == null }} OR store_location = {{ select1.selectedLabel }})


AND({{ !(dateRange1.endValue&&dateRange1.startValue) }} 
OR (transaction_date <= {{moment(dateRange1.endValue).format('YYYY-MM-DD')}} 
AND transaction_date >= {{moment(dateRange1.startValue).format('YYYY-MM-DD')}}) )
ORDER BY transaction_date DESC

