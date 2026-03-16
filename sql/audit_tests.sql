/*
Internal Audit Analytics Project
Transaction Monitoring Review

Author: Justice Kwabena Heflide
Tool: Microsoft SQL Server Management Studio
Purpose:
This script performs audit analytics on banking transaction data
to identify control exceptions and potential financial crime risks.

Audit Areas Covered:
1. High value transactions
2. Transaction monitoring alerts
3. Dormant account activity
4. High-risk customer monitoring
5. Transaction spikes
6. High-risk jurisdictions
7. Weekend transactions
8. Duplicate transactions
9. Merchant concentration risk
10. Monitoring control effectiveness
*/


------------------------------------------------------------
-- Audit Test 1: High Value Transactions
-- Objective: Identify transactions exceeding the $10,000 monitoring threshold that may require enhanced review.
------------------------------------------------------------
SELECT *
FROM transactions
WHERE amount > 10000;

------------------------------------------------------------
-- Audit Test 2: High Value Transactions Without Alerts
-- Objective: Verify that all high-value transactions triggered monitoring alerts, ensuring the transaction monitoring 
--            control is functioning effectively.
------------------------------------------------------------
SELECT t.transaction_id,
       t.amount,
       a.alert_id
FROM transactions t
LEFT JOIN alerts a
ON t.transaction_id = a.transaction_id
WHERE t.amount > 10000
AND a.alert_id IS NULL;

-----------------------------------------------------------
-- Audit Test 3: Transactions on inactive accounts
-- Objective: Detect transactions processed on accounts marked as inactive, which may indicate a breakdown in account status controls.
------------------------------------------------------------
SELECT t.transaction_id,
       t.account_id,
       a.status,
       t.amount
FROM transactions t
JOIN accounts a
ON t.account_id = a.account_id
WHERE a.status = 'Inactive';

-----------------------------------------------------------
-- Audit Test 4: Transactions by high-risk customers
-- Objective: Review transaction activity for customers classified as high risk to ensure appropriate monitoring and oversight.
------------------------------------------------------------
SELECT c.customer_id,
       c.name,
       SUM(t.amount) AS total_transaction_amount
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
JOIN transactions t
ON a.account_id = t.account_id
WHERE c.risk_rating = 'High'
GROUP BY c.customer_id, c.name;

-----------------------------------------------------------
-- Audit Test 5: Transaction Spikes
-- Objective: Identify accounts with unusually high numbers of transactions within a short time period, 
--            which may indicate suspicious activity or system anomalies.
------------------------------------------------------------
SELECT account_id,
       CAST(transaction_date AS DATE) AS txn_date,
       COUNT(*) AS txn_count
FROM transactions
GROUP BY account_id, CAST(transaction_date AS DATE)
HAVING COUNT(*) > 2;

-----------------------------------------------------------
-- Audit Test 6: High-risk Jurisdiction Transactions
-- Objective: Detect transactions involving jurisdictions identified as high risk for financial crime exposure.
------------------------------------------------------------
SELECT *
FROM transactions
WHERE country IN ('Iran','North Korea','Myanmar');


-----------------------------------------------------------
-- Audit Test 7: Weekend Transactions
-- Objective: Identify transactions occurring during non-standard operating periods that may require additional review.
------------------------------------------------------------
SELECT transaction_id,
       account_id,
       transaction_date,
       amount
FROM transactions
WHERE DATENAME(WEEKDAY, transaction_date) IN ('Saturday','Sunday');

-----------------------------------------------------------
-- Audit Test 8: Duplicate transactions
-- Objective: Detect duplicate transactions that may indicate system errors, duplicate processing, or fraudulent activity.
------------------------------------------------------------
SELECT account_id,
       amount,
       transaction_date,
       COUNT(*) AS duplicate_count
FROM transactions
GROUP BY account_id, amount, transaction_date
HAVING COUNT(*) > 1;

-----------------------------------------------------------
-- Audit Test 9: Merchant Transaction Concentration
-- Objective: Identify merchants receiving a disproportionately high number of transactions, which may indicate merchant fraud 
--            or unusual transaction patterns.
------------------------------------------------------------
SELECT merchant,
       COUNT(*) AS transaction_count,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY merchant
ORDER BY total_amount DESC;

-----------------------------------------------------------
-- Audit Test 10: Monitoring Control Effectiveness
-- Objective: Evaluate whether high-value transactions consistently trigger alerts, 
--            measuring the effectiveness of the transaction monitoring control.
------------------------------------------------------------
SELECT 
COUNT(t.transaction_id) AS total_high_value_transactions,
COUNT(a.alert_id) AS alerts_triggered,
(COUNT(a.alert_id) * 100.0 / COUNT(t.transaction_id)) AS alert_coverage_percentage
FROM transactions t
LEFT JOIN alerts a
ON t.transaction_id = a.transaction_id
WHERE t.amount > 10000;