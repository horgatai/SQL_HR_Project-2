-- ============================================================
-- 02_depression_by_demographics.sql
-- Depression rates broken down by gender, age group, and degree
-- ============================================================

-- Q8: Depression rate by gender
SELECT
  Gender,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Gender
ORDER BY depression_rate_pct DESC;

-- Q9: Depression rate by age group
SELECT
  CASE
    WHEN Age < 20 THEN 'Under 20'
    WHEN Age BETWEEN 20 AND 24 THEN '20-24'
    WHEN Age BETWEEN 25 AND 29 THEN '25-29'
    WHEN Age >= 30 THEN '30+'
  END AS age_group,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY age_group
ORDER BY depression_rate_pct DESC;

-- Q10: Depression rate by degree type
SELECT
  Degree,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Degree
ORDER BY depression_rate_pct DESC;

-- Q11: Depression rate by city (top 10 cities only)
SELECT
  City,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY City
HAVING total >= 100
ORDER BY depression_rate_pct DESC
LIMIT 10;
