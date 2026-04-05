-- ================================================
-- Bank Customer Churn Analysis
-- Tool: MySQL
-- Author: Rohan Pal
-- Description: SQL queries to analyze customer churn
--              patterns across demographics, geography,
--              product usage and account activity
-- ================================================


-- ------------------------------------------------
-- 1. Overall Churn Rate
-- Calculates total customers, total churned and
-- overall churn rate percentage as a baseline metric
-- ------------------------------------------------
SELECT 
    COUNT(customerId) TotalCustomers, 
    SUM(Exited) Totalchurned, 
    ROUND((SUM(Exited) / COUNT(*)) * 100, 2) churnRate
FROM churn_modelling;


-- ------------------------------------------------
-- 2. Churn Rate by Geography
-- Identifies which countries have the highest churn
-- to help target region-specific retention efforts
-- ------------------------------------------------
SELECT 
    Geography, 
    COUNT(customerId) TotalCustomers, 
    SUM(Exited) Totalchurned, 
    ROUND((SUM(Exited) / COUNT(*)) * 100, 2) churnRate
FROM churn_modelling
GROUP BY Geography;


-- ------------------------------------------------
-- 3. Churn Rate by Gender
-- Compares churn behavior between male and female
-- customers to detect gender-based patterns
-- ------------------------------------------------
SELECT 
    Gender, 
    COUNT(customerId) TotalCustomers, 
    SUM(Exited) Totalchurned, 
    ROUND((SUM(Exited) / COUNT(*)) * 100, 2) churnRate
FROM churn_modelling
GROUP BY Gender;


-- ------------------------------------------------
-- 4. Churn Rate by Age Group
-- Segments customers into age bands to identify
-- which age group is most at risk of churning
-- ------------------------------------------------
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN Age BETWEEN 31 AND 45 THEN '31-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+' 
    END AS age_range,
    COUNT(customerId) TotalCustomers, 
    SUM(Exited) Totalchurned, 
    ROUND((SUM(Exited) / COUNT(*)) * 100, 2) churnRate
FROM churn_modelling
GROUP BY age_range
ORDER BY age_range;


-- ------------------------------------------------
-- 5. Average Balance: Churned vs Retained
-- Compares average account balance between churned
-- and retained customers to assess financial impact
-- ------------------------------------------------
SELECT 
    CASE
        WHEN Exited = 1 THEN 'Exited'
        WHEN Exited = 0 THEN 'Retained'
    END AS CustomerStatus,
    AVG(Balance) avg_balance
FROM churn_modelling
GROUP BY CustomerStatus;


-- ------------------------------------------------
-- 6. Churn Rate by Number of Products
-- Analyzes whether holding more bank products
-- increases or decreases the likelihood of churning
-- ------------------------------------------------
SELECT 
    NumOfProducts, 
    COUNT(customerId) TotalCustomers, 
    SUM(Exited) Totalchurned, 
    ROUND((SUM(Exited) / COUNT(*)) * 100, 2) churnRate
FROM churn_modelling
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


-- ------------------------------------------------
-- 7. Churn Rate by Member Activity Status
-- Determines whether inactive members are more
-- likely to churn compared to active members
-- ------------------------------------------------
SELECT 
    CASE
        WHEN IsActiveMember = 1 THEN 'Active'
        WHEN IsActiveMember = 0 THEN 'Inactive'
    END AS Status,
    COUNT(customerId) TotalCustomers, 
    SUM(Exited) Totalchurned, 
    ROUND((SUM(Exited) / COUNT(*)) * 100, 2) churnRate
FROM churn_modelling
GROUP BY Status;
