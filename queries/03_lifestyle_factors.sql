-- ============================================================
-- 03_lifestyle_factors.sql
-- Impact of sleep, diet, and work/study hours on depression
-- ============================================================

-- Q12: Depression rate by sleep duration
SELECT
  Sleep_Duration,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Sleep_Duration
ORDER BY depression_rate_pct DESC;

-- Q13: Depression rate by dietary habits
SELECT
  Dietary_Habits,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Dietary_Habits
ORDER BY depression_rate_pct DESC;

-- Q14: Average work/study hours for depressed vs non-depressed students
SELECT
  Depression,
  ROUND(AVG(Work_Study_Hours), 2) AS avg_work_study_hours,
  COUNT(*)                        AS total
FROM `student_depression.survey`
GROUP BY Depression
ORDER BY Depression;

-- Q15: Depression rate by work/study hours bucket
SELECT
  CASE
    WHEN Work_Study_Hours <= 4  THEN '0-4 hrs'
    WHEN Work_Study_Hours <= 8  THEN '5-8 hrs'
    WHEN Work_Study_Hours <= 12 THEN '9-12 hrs'
    ELSE '12+ hrs'
  END AS hours_bucket,
  COUNT(*)                                            AS total,
  COUNTIF(Depression = 1)                             AS depressed,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY hours_bucket
ORDER BY depression_rate_pct DESC;

-- Q16: Combined: sleep + diet vs depression rate
SELECT
  Sleep_Duration,
  Dietary_Habits,
  COUNT(*)                                            AS total,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`
GROUP BY Sleep_Duration, Dietary_Habits
HAVING total >= 50
ORDER BY depression_rate_pct DESC;
