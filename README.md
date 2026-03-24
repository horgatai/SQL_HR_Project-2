# SQL_HR_Project-2 - Student Depression Analysis

A beginner-level SQL project analysing a student mental health survey dataset using **Google BigQuery**. Results are visualised in **Power BI**.

---

## Dataset

| Property | Value |
|---|---|
| Source | [Student Depression Dataset - Kaggle](https://www.kaggle.com/datasets/hopesb/student-depression-dataset) |
| Rows | ~27,900 |
| Target variable | `Depression` (0 = No, 1 = Yes) |

**Columns used:**

| Column | Type | Description |
|---|---|---|
| Gender | STRING | Male / Female |
| Age | FLOAT | Student age |
| City | STRING | City of residence |
| Degree | STRING | Academic degree (e.g. BSc, MBA, PhD) |
| Academic_Pressure | INT | Scale 1–5 |
| CGPA | FLOAT | Grade point average |
| Study_Satisfaction | INT | Scale 1–5 |
| Sleep_Duration | STRING | Categorical (e.g. 5–6 hours) |
| Dietary_Habits | STRING | Healthy / Moderate / Unhealthy |
| Financial_Stress | INT | Scale 1–5 |
| Work_Study_Hours | FLOAT | Daily hours spent studying/working |
| Suicidal_Thoughts | STRING | Yes / No |
| Family_History_Mental_Illness | STRING | Yes / No |
| Depression | INT | Binary outcome (0/1) |

---

## Project Goals

1. Explore the dataset and check data quality
2. Identify demographic groups with higher depression rates
3. Measure the impact of lifestyle factors (sleep, diet, hours)
4. Analyse academic and financial pressure as drivers of depression
5. Build a high-risk student profile using combined indicators

---

## Tools

| Tool | Purpose |
|---|---|
| Google BigQuery | SQL queries & analysis |
| Power BI | Data visualisation |
| GitHub | Version control & project documentation |

---

## Repository Structure

```
SQL_HR_Project-2/
├── README.md               ← Project overview (this file)
├── decisions.md            ← Design decisions and assumptions
├── results.md              ← Query results with BigQuery screenshots
├── visual_results.md       ← Power BI dashboard screenshots
└── queries/
    ├── 01_exploratory.sql
    ├── 02_depression_by_demographics.sql
    ├── 03_lifestyle_factors.sql
    ├── 04_academic_and_financial_pressure.sql
    └── 05_risk_factors.sql
```

---

## How to Run

1. Upload `Student_Depression_Dataset.csv` to a BigQuery dataset (e.g. `student_depression`)
2. Name the table `survey`
3. Rename columns to match the query files (replace spaces with underscores, e.g. `Academic Pressure` → `Academic_Pressure`)
4. Open any `.sql` file from the `queries/` folder and run it in the BigQuery console
