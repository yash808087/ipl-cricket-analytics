# ￿ IPL Cricket Analytics Dashboard
> *"What actually wins an IPL match — toss luck or team skill?"
> <img width="761" height="488" alt="dashboard_preview" src="https://github.com/user-attachments/assets/5e36b9b6-0589-48f9-8889-ccae29f36ab8" />

## ￿ Project Overview
Analyzed **15 seasons of IPL data** (2008–2022) covering **850+ matches**
and **180,000+ ball-by-ball delivery records** to find patterns in team
performance, player dominance, and winning strategies
## ￿ Business Questions Answered
| # | Question | Finding |
|---|----------|---------|
| 1 | Does winning the toss help win the match? | Only 47% — basically luck |
| 2 | Should you bat first or chase? | 64% prefer chasing — it works |
| 3 | Which team has dominated all seasons? | Mumbai Indians overall |
| 4 | Who are the all-time top performers? | Top 3 batsmen and bowlers identified |
| 5 | Is IPL scoring increasing over seasons? | Yes — every season beats the last |
## ￿ Tools & Technologies
| Tool | What I Used It For |
|------|--------------------|
| Microsoft Excel | Match summaries, pivot tables, win counts |
| MySQL | SQL queries with JOIN across two tables |
| Python (Pandas, Matplotlib, Seaborn) | EDA, 6 visualizations, trend analysis |
| Power BI | Interactive dark night-theme dashboard |
| GitHub | Version control and portfolio hosting |
## ￿ Key Insights- ￿ **Mumbai Indians** lead all-time wins across 15 seasons- ￿ **Toss win = match win only 47% of the time** — toss is overrated- ￿ **64% of teams choose to field first** after winning toss — chasing is preferred- ￿ Top 3 batsmen account for a massive share of all-time runs- ￿ **Runs per season trend upward** — T20 batting is evolving
## ￿ Key SQL Skill — JOIN Query
This project uses a **SQL JOIN** to connect two tables:- `matches` table — match-level data- `deliveries` table — ball-by-ball data
```sql
SELECT m.season, SUM(d.total_runs) AS total_runs
FROM matches m
JOIN deliveries d ON m.id = d.match_id
GROUP BY m.season
ORDER BY m.season;
￿ Project Structure
IPL_Project/
￿￿￿ data/
￿￿￿ excel/
￿￿￿ mysql/
￿￿￿ python/
￿￿￿ powerbi/
→ matches.csv + deliveries.csv
→ Match analysis + 4 pivot tables
→ 8 SQL queries (including JOINs)
→ Jupyter notebook + 6 visualizations
→ Night-theme dashboard (.pbix + .pdf)
￿￿￿ dashboard_preview.png
Dataset Source
IPL Complete Dataset — 2008 to 2022
￿ ￿ About
Yash | BCA Student — Data Science | Echelon Institute of Technology
Skills: Python · SQL · Power BI · Excel · Data Analysis “
