CREATE DATABASE ipl_db;
use ipl_db;

SHOW TABLES;
SELECT COUNT(*) FROM matches;

-- Q1 Total wins by team
SELECT
winner AS team,
COUNT(*) AS total_wins
FROM matches
WHERE winner IS NOT NULL AND winner != ''
GROUP BY winner
ORDER BY total_wins DESC;


-- Q2 Does winning toss help?
SELECT
COUNT(*) AS total_matches,
SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) AS toss_win_and_match_win,
ROUND(
SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
) AS percentage
FROM matches
WHERE winner != '';

-- Q3 Bat first or chase — which wins more?
SELECT
toss_decision,
COUNT(*) AS times_chosen,
SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) AS won_after_choosing,
ROUND(
SUM(CASE WHEN toss_winner = winner THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1
) AS win_percent
FROM matches
WHERE winner != ''
GROUP BY toss_decision;

-- Q4 Top 10 Player of Match award winners:
SELECT
player_of_match,
COUNT(*) AS awards
FROM matches
WHERE player_of_match IS NOT NULL AND player_of_match != ''
GROUP BY player_of_match
ORDER BY awards DESC
LIMIT 10;

-- Q5 Top 10 run scorers
SELECT
batsman,
SUM(batsman_runs) AS total_runs,
COUNT(DISTINCT match_id) AS matches_played,
ROUND(SUM(batsman_runs) / COUNT(DISTINCT match_id), 1) AS avg_per_match
FROM deliveries
GROUP BY batsman
ORDER BY total_runs DESC
LIMIT 10;

-- Q6 Top 10 wicket takers
SELECT
bowler,
COUNT(*) AS total_wickets,
COUNT(DISTINCT match_id) AS matches_bowled
FROM deliveries
WHERE is_wicket = 1
AND dismissal_kind NOT IN ('run out', 'retired hurt', 'obstructing the field')
GROUP BY bowler
ORDER BY total_wickets DESC
LIMIT 10;

-- Q7 Venue with highest scoring matches
SELECT
m.venue,
COUNT(DISTINCT m.id) AS total_matches,
SUM(d.total_runs) AS total_runs,
ROUND(SUM(d.total_runs) / COUNT(DISTINCT m.id), 0) AS avg_runs_per_match
FROM matches m
JOIN deliveries d ON m.id = d.match_id
GROUP BY m.venue
ORDER BY avg_runs_per_match DESC
LIMIT 10;

-- Q8 Season by season run trends
SELECT
m.season,
SUM(d.total_runs) AS total_runs,
COUNT(DISTINCT m.id) AS matches_played,
ROUND(SUM(d.total_runs) / COUNT(DISTINCT m.id), 0) AS avg_per_match
FROM matches m
JOIN deliveries d ON m.id = d.match_id
GROUP BY m.season
ORDER BY m.season; 