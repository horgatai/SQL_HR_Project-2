-- ============================================================
-- 01_exploratory.sql
-- Dataset overview and data quality checks
-- ============================================================

-- Q1: Total number of records
SELECT COUNT(*) AS total_records
FROM `student_depression.survey`;

-- Q2: Count of distinct values per categorical column
SELECT
  COUNT(DISTINCT Gender)        AS unique_genders,
  COUNT(DISTINCT City)          AS unique_cities,
  COUNT(DISTINCT Profession)    AS unique_professions,
  COUNT(DISTINCT Degree)        AS unique_degrees,
  COUNT(DISTINCT Sleep_Duration) AS unique_sleep_categories,
  COUNT(DISTINCT Dietary_Habits) AS unique_diet_categories
FROM `student_depression.survey`;

-- Q3: Check for NULL values in key columns
SELECT
  COUNTIF(Gender IS NULL)                     AS null_gender,
  COUNTIF(Age IS NULL)                        AS null_age,
  COUNTIF(CGPA IS NULL)                       AS null_cgpa,
  COUNTIF(Academic_Pressure IS NULL)          AS null_academic_pressure,
  COUNTIF(Sleep_Duration IS NULL)             AS null_sleep_duration,
  COUNTIF(Depression IS NULL)                 AS null_depression
FROM `student_depression.survey`;

-- Q4: Age distribution — min, max, average
SELECT
  MIN(Age)   AS min_age,
  MAX(Age)   AS max_age,
  ROUND(AVG(Age), 1) AS avg_age
FROM `student_depression.survey`;

-- Q5: Overall depression rate
SELECT
  COUNTIF(Depression = 1)                            AS depressed_count,
  COUNT(*)                                           AS total_count,
  ROUND(COUNTIF(Depression = 1) / COUNT(*) * 100, 1) AS depression_rate_pct
FROM `student_depression.survey`;

-- Q6: Gender breakdown
SELECT
  Gender,
  COUNT(*) AS count
FROM `student_depression.survey`
GROUP BY Gender
ORDER BY count DESC;

-- Q7: Top 10 cities by number of students
SELECT
  City,
  COUNT(*) AS student_count
FROM `student_depression.survey`
GROUP BY City
ORDER BY student_count DESC
LIMIT 10;
