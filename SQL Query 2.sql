WITH top_countries AS (
  SELECT country, COUNT(*) as user_count
  FROM Users
  GROUP BY country
  ORDER BY user_count DESC
  LIMIT 3
)
SELECT U.country, UI.interest, COUNT(*) as interest_count
FROM Users U
JOIN UserInterests UI ON U.user_id = UI.user_id
WHERE U.country IN (SELECT country FROM top_countries)
GROUP BY U.country, UI.interest
ORDER BY U.country, interest_count DESC;