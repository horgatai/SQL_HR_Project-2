-- ============================================================
-- 05_risk_factors.sql
-- Suicidal thoughts, family history, study satisfaction
-- as risk indicators for depression
-- ============================================================

-- Q22: Depression rate by suicidal thoughts history
SELECT
  Suicidal_Thoughts,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Suicidal_Thoughts
ORDER BY depression_rate_pct DESC;

-- Q23: Depression rate by family history of mental illness
SELECT
  Family_History_Mental_Illness,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Family_History_Mental_Illness
ORDER BY depression_rate_pct DESC;

-- Q24: Depression rate by study satisfaction (1-5)
SELECT
  Study_Satisfaction,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Study_Satisfaction
ORDER BY Study_Satisfaction;

-- Q25: High-risk student profile
-- Defines a "high-risk" student as someone with:
-- academic pressure >= 4, financial stress >= 4,
-- sleep < 7 hours, suicidal thoughts = Yes
SELECT
  COUNT(*)                                            AS high_risk_total,
  COUNTIF(Depression = 1)                             AS high_risk_depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS high_risk_depression_rate_pct
FROM `student_depression.survey`
WHERE
  Academic_Pressure >= 4
  AND Financial_Stress >= 4
  AND Sleep_Duration IN ('Less than 5 hours', '5-6 hours')
  AND Suicidal_Thoughts = 'Yes';

-- Q26: Study satisfaction vs academic pressure — average by depression status
SELECT
  Depression,
  ROUND(AVG(Study_Satisfaction), 2)  AS avg_study_satisfaction,
  ROUND(AVG(Academic_Pressure), 2)   AS avg_academic_pressure,
  COUNT(*)                            AS total
FROM `student_depression.survey`
GROUP BY Depression
ORDER BY Depression;
