-- Query 4B: Balance vs Churn with Percentages
-- Shows both counts AND percentage of total
SELECT 
    Exited,
    ROUND(AVG(Balance), 2) as avg_balance,
    COUNT(*) as customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Churn_Modelling), 2) as pct_of_total
FROM Churn_Modelling
GROUP BY Exited
ORDER BY Exited;

-- Results interpretation:
-- 79.63% of customers stayed (avg balance $72,745)
-- 20.37% of customers left (avg balance $91,108)
-- Higher balance customers have HIGHER churn rate
