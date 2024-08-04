INSERT INTO Users (user_id, username, email, join_date, country, bio) VALUES
('U001', 'Alice', 'alice@example.com', '2022-01-15', 'USA', 'I love reading.'),
('U002', 'Bob', 'bob@example.com', '2022-02-20', 'UK', 'Travel enthusiast.'),
('U003', 'Charlie', 'charlie@example.com', '2022-03-25', 'Canada', 'Coffee addict.'),
('U004', 'David', 'david@example.com', '2022-04-10', 'USA', 'Aspiring chef.'),
('U005', 'Eve', 'eve@example.com', '2022-05-05', 'UK', 'Tech geek.');


INSERT INTO Posts (post_id, user_id, content, timestamp, likes_count, comments_count) VALUES
('P001', 'U001', 'Post by Alice 1', '2023-01-10 08:00:00', 10, 2),
('P002', 'U001', 'Post by Alice 2', '2023-02-15 09:00:00', 15, 3),
('P003', 'U001', 'Post by Alice 3', '2023-03-20 10:00:00', 5, 1),
('P004', 'U001', 'Post by Alice 4', '2023-04-25 11:00:00', 20, 4),
('P005', 'U001', 'Post by Alice 5', '2023-05-30 12:00:00', 25, 5),
('P006', 'U002', 'Post by Bob 1', '2023-01-15 13:00:00', 30, 6),
('P007', 'U003', 'Post by Charlie 1', '2023-02-20 14:00:00', 35, 7),
('P008', 'U004', 'Post by David 1', '2023-03-25 15:00:00', 40, 8),
('P009', 'U005', 'Post by Eve 1', '2023-04-30 16:00:00', 45, 9);


INSERT INTO Comments (comment_id, post_id, user_id, content, timestamp) VALUES
('C001', 'P001', 'U001', 'Comment on own post', '2023-01-10 08:30:00'),
('C002', 'P006', 'U003', 'Nice post!', '2023-01-15 13:30:00'),
('C003', 'P007', 'U004', 'Great post!', '2023-02-20 14:30:00'),
('C004', 'P008', 'U005', 'Interesting post!', '2023-03-25 15:30:00'),
('C005', 'P009', 'U002', 'Love this post!', '2023-04-30 16:30:00');


INSERT INTO Friendships (friendship_id, user_id1, user_id2, status, created_at) VALUES
('F001', 'U001', 'U002', 'accepted', '2023-01-01'),
('F002', 'U002', 'U001', 'accepted', '2023-01-01'),
('F003', 'U003', 'U004', 'pending', '2023-02-01'),
('F004', 'U004', 'U005', 'accepted', '2023-03-01'),
('F005', 'U005', 'U004', 'accepted', '2023-03-01');


INSERT INTO UserInterests (interest_id, user_id, interest) VALUES
('I001', 'U001', 'Reading'),
('I002', 'U001', 'Traveling'),
('I003', 'U002', 'Traveling'),
('I004', 'U003', 'Coffee'),
('I005', 'U004', 'Cooking'),
('I006', 'U005', 'Tech');
