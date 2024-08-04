SELECT U1.user_id AS user1_id, U1.username AS user1_name, U2.user_id AS user2_id, U2.username AS user2_name, UI1.interest
FROM Users U1
JOIN Friendships F1 ON U1.user_id = F1.user_id1 AND F1.status = 'accepted'
JOIN Friendships F2 ON U1.user_id = F2.user_id2 AND F2.status = 'accepted' AND F1.user_id2 = F2.user_id1
JOIN Users U2 ON U2.user_id = F1.user_id2
JOIN UserInterests UI1 ON U1.user_id = UI1.user_id
JOIN UserInterests UI2 ON U2.user_id = UI2.user_id AND UI1.interest = UI2.interest;
