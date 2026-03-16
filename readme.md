________________________________________
📘 Internal Audit Analytics Project– Transaction Monitoring Review

A SQL based audit analytics project by Justice Kwabena Heflide
________________________________________
📌 Project Overview
This project demonstrates how internal auditors can use SQL driven analytics to evaluate the effectiveness of transaction monitoring controls within a financial institution. Using a synthetic banking dataset, the project performs a series of audit tests to identify:
1.	High value transactions
2.	Control exceptions
3.	Potential financial crime indicators
4.	Monitoring coverage gaps
5.	Customer and merchant risk patterns
   
The project is built in Microsoft SQL Server Management Studio (SSMS) and is designed to showcase practical audit analytics techniques for internal audit, compliance, and financial crime teams.
________________________________________
📂 Dataset Description
The project uses four CSV files representing core banking data:

File	                     Description
customers.csv	             Customer profiles including country and risk rating
accounts.csv	             Account details and status (Active/Inactive)
transactions.csv	         All financial transactions with merchant, channel, and country
alerts.csv	               Transaction monitoring alerts triggered by the system

These datasets simulate a realistic environment for testing AML and internal audit controls.
________________________________________

🧪 Audit Tests Performed
The SQL script performs 10 audit tests; each aligned with a specific audit objective.

1. High Value Transactions
Identifies transactions exceeding the $10,000 threshold.
2. High Value Transactions Without Alerts
Validates whether all high value transactions triggered monitoring alerts.
3. Transactions on Inactive Accounts
Detects activity on accounts marked as inactive — a key control failure.
4. High Risk Customer Monitoring
Aggregates transaction activity for customers classified as High Risk.
5. Transaction Spikes
Flags accounts with unusually high transaction counts in a single day.
6. High Risk Jurisdiction Transactions
Identifies exposure to countries with elevated financial crime risk.
7. Weekend Transactions
Detects transactions occurring outside standard business days.
8. Duplicate Transactions
Checks for potential system errors or fraudulent duplicate postings.
9. Merchant Concentration Risk
Analyzes merchants receiving disproportionately high transaction volumes.
10. Monitoring Control Effectiveness
Measures alert coverage for high value transactions.
________________________________________
📊 Key Findings (From the Dataset)
A summary of insights generated from running the SQL tests:
1.	Two high value transactions were detected — both triggered alerts (100% coverage).
2.	One control exception: a transaction occurred on an inactive account.
3.	High risk customer (Ahmed Hassan) had $7,000 in transactions.
4.	No duplicate transactions, weekend activity, or high risk jurisdictions.
5.	Merchant activity was evenly distributed — no concentration risk.
These results demonstrate how SQL analytics can surface control gaps and validate monitoring effectiveness.
________________________________________
🛠️ Tools & Technologies
1.	Microsoft SQL Server Management Studio (SSMS)
2.	Visual Studio
3.	Internal audit & AML domain logic
________________________________________
📁 Project Structure
internal-audit-sql-project

│
├── dataset

│   ├── customers.csv

│   ├── accounts.csv

│   ├── transactions.csv

│   └── alerts.csv
│
├── sql

│   └── audit_tests.sql

│
├── report

│   └── audit_findings.md

│
└── README.md

Repository Contents
1.	dataset/ – Sample banking datasets used for the analysis
2.	sql/ – SQL scripts performing audit analytics tests
3.	report/ – Documentation of audit findings and insights
4.	README.md – Project overview and documentation
________________________________________

🎯 Project Purpose
This project demonstrates:
1.	How internal auditors can use SQL to perform automated control testing
2.	How to identify financial crime red flags using data analytics
3.	How to validate monitoring system effectiveness
4.	How to structure an audit analytics workflow end to end
________________________________________
🚀 How to Run the Project
1.	Import the CSV files into SQL Server (or create tables manually).
2.	Open the audit tests.sql script in SSMS.
3.	Execute each audit test section to generate findings.
4.	Review results and compare against expected control behavior.
________________________________________
🧑‍💻 Author
Justice Kwabena Heflide

Internal Control & Data Analytics Professional

SQL • Audit Analytics • Financial Crime • Risk & Controls




