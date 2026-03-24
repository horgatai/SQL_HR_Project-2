-- ============================================================
-- 04_academic_and_financial_pressure.sql
-- How academic pressure, CGPA, and financial stress relate to depression
-- ============================================================

-- Q17: Depression rate by academic pressure level (1-5)
SELECT
  Academic_Pressure,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Academic_Pressure
ORDER BY Academic_Pressure;

-- Q18: Average CGPA for depressed vs non-depressed students
SELECT
  Depression,
  ROUND(AVG(CGPA), 2) AS avg_cgpa,
  ROUND(MIN(CGPA), 2) AS min_cgpa,
  ROUND(MAX(CGPA), 2) AS max_cgpa,
  COUNT(*)            AS total
FROM `student_depression.survey`
GROUP BY Depression
ORDER BY Depression;

-- Q19: Depression rate by CGPA range
SELECT
  CASE
    WHEN CGPA < 6.0 THEN 'Below 6.0'
    WHEN CGPA BETWEEN 6.0 AND 7.49 THEN '6.0 - 7.49'
    WHEN CGPA BETWEEN 7.5 AND 8.99 THEN '7.5 - 8.99'
    ELSE '9.0+'
  END AS cgpa_range,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY cgpa_range
ORDER BY depression_rate_pct DESC;

-- Q20: Depression rate by financial stress level (1-5)
SELECT
  Financial_Stress,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Financial_Stress
ORDER BY Financial_Stress;

-- Q21: Combined academic pressure + financial stress
SELECT
  Academic_Pressure,
  Financial_Stress,
  COUNT(*)                                            AS total,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Academic_Pressure, Financial_Stress
HAVING total >= 30
ORDER BY depression_rate_pct DESC
LIMIT 10;
