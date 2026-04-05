# Bank Customer Churn Analysis
**Tools:** MySQL | Microsoft Excel  
**Dataset:** [Bank Customer Churn Dataset — Kaggle](https://www.kaggle.com/datasets/shantanudhakadd/bank-customer-churn-prediction)  
**Records:** 10,000 customers | 14 columns

---

## Project Overview

Customer churn — when a customer closes their account and leaves the bank — is one of the most critical problems in the banking industry. Banks rely on customer deposits as a source of funds, so losing customers directly impacts liquidity, revenue and market share.

This project analyzes a bank's customer dataset to:
- Calculate the overall churn rate and establish a baseline
- Identify which customer segments are most at risk of churning
- Uncover patterns across geography, gender, age, account balance, product usage and activity status
- Provide actionable business recommendations to reduce churn

---

## Dataset Description

| Column | Description |
|---|---|
| CustomerId | Unique customer identifier |
| Geography | Country of the customer (France, Spain, Germany) |
| Gender | Male or Female |
| Age | Customer age |
| Tenure | Number of years as a customer |
| Balance | Account balance |
| NumOfProducts | Number of bank products held |
| HasCrCard | Whether customer has a credit card (1 = Yes, 0 = No) |
| IsActiveMember | Whether customer is active (1 = Yes, 0 = No) |
| EstimatedSalary | Estimated annual salary |
| Exited | Whether customer churned (1 = Yes, 0 = No) — target variable |

> Columns dropped from analysis: `RowNumber`, `Surname` — identifiers with no analytical value

---

## Data Quality Check

Before analysis, the dataset was validated for:

- **Blank cells** — None found
- **Duplicate rows** — None found  
- **Target column integrity** — `Exited` contains only 0 and 1 values

The dataset was clean and required no preprocessing.

---

## Key Findings

### 1. Overall Churn Rate
| Total Customers | Total Churned | Churn Rate |
|---|---|---|
| 10,000 | 2,037 | 20.37% |

The bank's churn rate sits at the higher end of the industry average (15–20%), indicating a significant retention problem worth investigating.

---

### 2. Churn by Geography
| Geography | Total Customers | Churned | Churn Rate |
|---|---|---|---|
| France | 5,014 | 810 | 16.15% |
| Spain | 2,477 | 413 | 16.67% |
| Germany | 2,509 | 814 | **32.44%** |

Germany is a critical outlier — with only 25% of the total customer base, it accounts for nearly 40% of all churns. France and Spain are within the acceptable range.

---

### 3. Churn by Gender
| Gender | Total Customers | Churned | Churn Rate |
|---|---|---|---|
| Female | 4,543 | 1,139 | **25.07%** |
| Male | 5,457 | 898 | 16.46% |

Female customers churn at a significantly higher rate despite being a smaller group — a pattern worth investigating from a product and service experience perspective.

---

### 4. Churn by Age Group
| Age Group | Total Customers | Churned | Churn Rate |
|---|---|---|---|
| 18–30 | 1,968 | 148 | 7.52% |
| 31–45 | 5,921 | 932 | 15.74% |
| 46–60 | 1,647 | 842 | **51.12%** |
| 60+ | 464 | 115 | 24.78% |

The 46–60 age group has an alarming churn rate of over 51%. This could be attributed to a lack of age-appropriate products or poor digital banking experience for older customers.

---

### 5. Average Balance: Churned vs Retained
| Status | Average Balance |
|---|---|
| Exited | $91,108 |
| Retained | $72,745 |

Churned customers hold 25% higher average balances than retained ones — the bank is losing its most financially valuable customers, which directly impacts liquidity.

---

### 6. Churn by Number of Products
| Products | Total Customers | Churned | Churn Rate |
|---|---|---|---|
| 1 | 5,084 | 1,409 | 27.71% |
| 2 | 4,590 | 348 | **7.58%** |
| 3 | 266 | 220 | 82.71% |
| 4 | 60 | 60 | 100.00% |

2 products is the clear retention sweet spot. Beyond that, churn spikes dramatically — suggesting aggressive cross-selling may be creating customer frustration rather than loyalty.

---

### 7. Churn by Activity Status
| Status | Total Customers | Churned | Churn Rate |
|---|---|---|---|
| Active | 5,151 | 735 | 14.27% |
| Inactive | 4,849 | 1,302 | **26.85%** |

Inactive members churn at nearly double the rate of active members, making inactivity an early and reliable warning signal for potential churn.

---

## Business Recommendations

1. **Focus retention efforts on Germany** — investigate whether pricing, product fit or service quality is driving the disproportionately high churn rate
2. **Research female customer pain points** — survey female customers to understand whether product offerings or service experience is falling short
3. **Develop age-appropriate solutions for the 46–60 segment** — consider dedicated relationship managers, simplified digital interfaces or tailored financial products
4. **Prioritize high-balance at-risk customers** — implement personal outreach programs for customers with high balances showing signs of disengagement
5. **Avoid cross-selling beyond 2 products** — the data shows over-bundling backfires; focus on quality of engagement rather than quantity of products
6. **Build an inactivity early warning system** — trigger re-engagement campaigns (offers, check-in calls, incentives) when customers show inactivity signals

---

## Excel Dashboard

The dashboard includes:
- **KPI Cards** — Total Customers, Total Churned, Churn Rate
- **Churn Rate by Country** — Column chart
- **Churn Rate by Gender** — Pie chart
- **Churn Rate by Age Group** — Column chart
- **Average Balance: Churned vs Retained** — Column chart
- **Churn Rate by Number of Products** — Column chart
- **Churn Rate by Activity Status** — Pie chart

---

## Files in this Repository

| File | Description |
|---|---|
| `bank_churn_analysis.sql` | All MySQL queries with comments |
| `bank_churn_dashboard.xlsx` | Excel dashboard with charts and KPI cards |
| `README.md` | Project documentation |

---

## Author

**Rohan Pal**  
[GitHub](https://github.com/rohanpal7865) | rohanpal7865@gmail.com
