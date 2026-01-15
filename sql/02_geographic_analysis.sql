-- ============================================
-- DAY 3: Geographic Analysis
-- Date: January 16, 2026
-- Question: Does geography affect churn?
-- ============================================

-- Query 1: List unique countries
SELECT DISTINCT Geography
FROM Churn_Modelling;
-- Result: France, Germany, Spain

-- Query 2: Customer distribution by country
SELECT 
    Geography,
    COUNT(*) as customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Churn_Modelling), 2) as pct_of_total
FROM Churn_Modelling
GROUP BY Geography
ORDER BY customer_count DESC;

-- Query 3: CHURN RATE BY COUNTRY (Main Analysis)
SELECT 
    Geography,
    COUNT(*) as total_customers,
    SUM(Exited) as churned_customers,
    ROUND(AVG(Exited) * 100, 2) as churn_rate_pct,
    ROUND(AVG(Balance), 2) as avg_balance
FROM Churn_Modelling
GROUP BY Geography
ORDER BY churn_rate_pct DESC;

-- RESULTS:
-- Germany: 2,509 customers | 814 churned | 32.44% churn rate | $119,730 avg balance
-- Spain:   2,477 customers | 413 churned | 16.67% churn rate | $61,818 avg balance  
-- France:  5,014 customers | 810 churned | 16.15% churn rate | $62,093 avg balance

-- FINDING: 
-- Germany has CRITICAL churn problem (32.44% vs ~16% in France/Spain)
-- Despite highest customer balances, Germany losing wealthiest customers
-- Geographic location is major churn factor - Germany market needs urgent intervention