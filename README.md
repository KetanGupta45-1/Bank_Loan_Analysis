# 🏦 Bank Loan Analysis & Visualization — Power BI Project

A complete Power BI reporting solution that explores, visualizes, and explains key metrics in bank loan performance — including total applications, capital flow, interest rates, and loan quality breakdowns. This project integrates SQL querying, domain knowledge, and business-friendly insights for loan-based decision-making.

---

## 📁 Project Files

- `Analysis Visualization.pbix`: Fully interactive Power BI dashboard.
- `Query Doc.docx`: SQL scripts used for KPIs and trend summaries.
- `Domain Knowledge Doc.docx`: Background on bank loan processes and real-world application.
- `Terminologies in Data.docx`: Data definitions for business fields and banking terms.

---

## 📊 Key Metrics (KPIs)

| Metric | Description |
|--------|-------------|
| **Total Applications** | Total loan applications submitted. |
| **Funded Amount** | Total capital disbursed by the bank. |
| **Amount Received** | Total repayments collected to date. |
| **Average Interest Rate** | Mean interest rate applied to all loans. |
| **Average DTI** | Debt-to-Income ratio across borrowers. |
| **Good Loan %** | % of loans either fully paid or currently active. |
| **Bad Loan %** | % of loans charged off (defaulted). |
| **MTD/PMTD Trends** | Month-to-Date vs. Previous Month comparisons for volume, capital, interest, and DTI. |

---

## 📈 Dashboard Visuals

- **Monthly Analysis**: Applications, funded capital, repayments, interest, and DTI.
- **Loan Quality**: Good vs. Bad loans by count, capital, and repayment.
- **Purpose Analysis**: Insights by loan intent (e.g., education, home, medical).
- **Geographic Insights**: Loan trends by U.S. states.
- **Demographic Breakdown**: Analysis by employment length, home ownership, and loan terms.

---

## 🧠 Domain Context

> *"Understanding loan risk and performance is crucial for managing a bank’s portfolio and profitability."*

The report draws on real-world banking workflows:
- Loan application screening (identity, credit, employment, income, collateral).
- Risk profiling using DTI, credit score, and repayment history.
- Decision-making driven by regional, financial, and behavioral patterns.

📎 More on this is documented in `Domain Knowledge Doc.docx`.

---

## 🔎 Data Definitions (Glossary)

A few important fields:
- `loan_status`: Fully Paid, Current, Charged Off.
- `loan_amount`: Principal disbursed to the borrower.
- `total_payment`: Actual repayments made.
- `int_rate`: Annualized interest on loan.
- `dti`: Ratio of monthly debt payments to income.
- `emp_length`, `home_ownership`, `purpose`: Borrower profile details.

📎 Full list with business use cases is in `Terminologies in Data.docx`.

---

## ⚙️ SQL Query Base

The entire data model is driven by SQL queries such as:

```sql
-- Good Loan Percentage
SELECT
  (COUNT(CASE WHEN loan_status IN ('Fully Paid', 'Current') THEN id END) * 100.0) / COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data;
