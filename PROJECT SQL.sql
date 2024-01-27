CREATE DATABASE Assignment;

USE Assignment;

SELECT * FROM finance1;
SELECT COUNT(*) FROM finance1;

SELECT * FROM finance2;
SELECT COUNT(*) FROM finance2;


# KPI 1
## Year wise loan amount Stats
SELECT YEAR(issue_D) AS Year_of_issue_D , SUM(loan_amnt) AS 'Total loan amount'
FROM finance1
GROUP BY Year_of_issue_D
ORDER BY Year_of_issue_D;

# KPI 2
## Grade and sub grade wise revol_bal
SELECT 
grade ,sub_grade , SUM(revol_bal) AS Total_revol_bal
FROM finance1 INNER JOIN finance2
ON(finance1.id=finance2.id)
GROUP BY grade , sub_grade
ORDER BY grade , sub_grade;

# KPI 3
## Total Payment for Verified Status Vs Total Payment for Non Verified Status
SELECT verification_status, 
CONCAT("$", FORMAT(ROUND(SUM(total_pymnt)/1000000,2),2),"M") AS Total_payment
FROM finance1 
INNER JOIN finance2
ON(finance1.id=finance2.id)
GROUP BY verification_status;

# KPI 4
## State wise and last_credit_pull_d wise loan status
SELECT addr_State, last_credit_pull_d , loan_status
FROM finance1 INNER JOIN finance2
ON(finance1.id=finance2.id)
GROUP BY addr_State, last_credit_pull_d , loan_status
ORDER BY addr_State;


# KPI 5
## Home ownership Vs last payment date stats
SELECT
home_ownership, last_pymnt_d,
CONCAT(FORMAT(ROUND(SUM(last_pymnt_amnt)/10000,2),2),"K") AS Total_amount
FROM finance1
INNER JOIN finance2 
ON finance1.id=finance2.id
GROUP BY home_ownership ,last_pymnt_d
ORDER BY last_pymnt_d DESC, home_ownership DESC;
