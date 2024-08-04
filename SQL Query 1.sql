SELECT U.user_id, U.username, COUNT(P.post_id) AS post_count
FROM Users U
JOIN Posts P ON U.user_id = P.user_id
GROUP BY U.user_id, U.username
HAVING COUNT(P.post_id) > 5;
