# Decisions & Assumptions

This file documents the analytical choices made throughout the project and the reasoning behind them.

---

## Data Cleaning Assumptions

**Column renaming**
BigQuery does not support spaces in column names. All columns were renamed on import using underscores:
- `Academic Pressure` → `Academic_Pressure`
- `Sleep Duration` → `Sleep_Duration`
- `Dietary Habits` → `Dietary_Habits`
- `Have you ever had suicidal thoughts ?` → `Suicidal_Thoughts`
- `Work/Study Hours` → `Work_Study_Hours`
- `Financial Stress` → `Financial_Stress`
- `Family History of Mental Illness` → `Family_History_Mental_Illness`
- `Study Satisfaction` → `Study_Satisfaction`

**Profession column**
The vast majority of records have `Profession = 'Student'`. A small number of non-student records (e.g. Architect) were kept in the dataset since removing them would not significantly change results and the analysis focuses on student-level variables.

**Work Pressure column**
The `Work Pressure` column contains `0.0` for nearly all student records, indicating it is not relevant for this student-focused dataset. It was excluded from all analyses.

**Job Satisfaction column**
Similarly, `Job Satisfaction` contains `0.0` for the student subset and was not used.

---

## Analytical Decisions

**HAVING total >= 100 / >= 50 / >= 30**
When grouping by multiple dimensions (e.g. city, combined pressure+stress), a minimum group size threshold was applied to avoid misleading percentages from very small samples. The exact threshold varies by query and is documented inline.

**CGPA ranges**
CGPA values range from ~5.0 to ~10.0. The four buckets (Below 6.0 / 6.0–7.49 / 7.5–8.99 / 9.0+) were chosen to reflect rough academic performance tiers.

**Age groups**
Four buckets were used: Under 20, 20–24, 25–29, 30+. These reflect common student life stages (school-leaving, undergraduate, postgraduate, mature student).

**Work/Study Hours buckets**
Grouped into 0–4, 5–8, 9–12, and 12+ to align with typical "light", "moderate", "heavy", and "extreme" study loads.

**High-risk profile (Q25)**
The high-risk filter combines four simultaneously present stressors: academic pressure ≥ 4, financial stress ≥ 4, sleep ≤ 6 hours, and prior suicidal thoughts. This is not a clinical definition — it is an exploratory analytical construct to estimate the depression rate in the most pressured group.

---

## Scope Limitations

- The dataset is survey-based and self-reported; results describe associations, not causation.
- The dataset appears to be focused on Indian cities; findings may not generalise to other contexts.
- `Depression` is a binary label from the survey, not a clinical diagnosis.
