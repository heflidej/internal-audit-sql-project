# Internal Audit Analytics Report
Transaction Monitoring Review

## Objective
The objective of this analysis was to use SQL analytics to test key transaction monitoring controls and identify potential risk indicators within transaction data.

## Scope
The review covered the following datasets:
- Customers
- Accounts
- Transactions
- Alerts

Analysis was performed using Microsoft SQL Server.

---

## Audit Test 1: High Value Transactions

Control:
Transactions above $10,000 should trigger monitoring alerts.

Result:
Two high-value transactions were identified.

Transaction IDs:
- 5002
- 5006

---

## Audit Test 2: High Value Transactions Without Alerts

Objective:
Determine whether all high-value transactions triggered alerts.

Result:
No exceptions were identified. All high-value transactions generated alerts.

Control effectiveness appears adequate.

---

## Audit Test 3: Transactions on Inactive Accounts

Objective:
Identify transactions processed on inactive accounts.

Finding:
Transaction with ID 5005 occurred on an account marked as inactive.

Risk:
This may indicate a breakdown in account status validation controls.

Recommendation:
Implement automated checks preventing transactions on inactive accounts.

---

## Audit Test 4: High Risk Customer Activity

Objective:
Review transaction activity for customers classified as high risk.

Finding:
Customer 1003 executed transactions totaling $7000.

Recommendation:
Ensure enhanced monitoring for high-risk customers.

---

## Conclusion

SQL analytics successfully identified potential control exceptions and provided insights into transaction monitoring effectiveness.

This approach demonstrates how data analytics can support internal audit procedures in financial institutions.