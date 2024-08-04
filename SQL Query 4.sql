SELECT U.username, P.content AS post_content, C.content AS comment_content
FROM Users U
JOIN Posts P ON U.user_id = P.user_id
JOIN Comments C ON P.post_id = C.post_id AND U.user_id = C.user_id;
