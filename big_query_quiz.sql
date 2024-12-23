-- This query shows a list of the daily top Google Search terms.
SELECT
 t.refresh_date AS Day,
 t.term AS Top_Term,
 t.rank
 --s.country_code
 -- region
FROM `bigquery-public-data.google_trends.top_terms` t
--JOIN `bigquery-public-data.google_trends.international_top_terms` s
--ON t.term = s.term
WHERE
 t.rank <= 3
 -- Choose only the top term each day.
 AND t.refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
 -- Filter to the last month.
 -- Q3. Add Region Filtering:
 --AND s.country_code = "UK"
 -- There does not exist a column for region.
GROUP BY Day, Top_Term, t.rank
ORDER BY Day DESC
 -- Show the days in reverse chronological order.

