
CREATE TABLE Users (
	user_id VARCHAR(8) PRIMARY KEY NOT NULL,
	username VARCHAR(32) NOT NULL,
	email VARCHAR(64) UNIQUE NOT NULL,
	join_date DATETIME NOT NULL,
	country VARCHAR(32) NOT NULL,
	bio VARCHAR(512)
	);


CREATE TABLE Posts (
	post_id VARCHAR(8) PRIMARY KEY NOT NULL,
    user_id VARCHAR(8) NOT NULL,
    content VARCHAR(512),
    timestamp DATETIME NOT NULL,
    likes_count INT DEFAULT 0,
    comments_count INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
    );
    
    
CREATE TABLE Comments (
	comment_id VARCHAR(8) PRIMARY KEY NOT NULL,
    post_id VARCHAR(8) NOT NULL,
    user_id VARCHAR(8) NOT NULL,
    content VARCHAR(512),
    timestamp DATETIME NOT NULL,
    FOREIGN KEY(post_id) REFERENCES Posts(post_id),
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
    );
    
    
CREATE TABLE Friendships (
	friendship_id VARCHAR(8) PRIMARY KEY NOT NULL,
    user_id1 VARCHAR(8) NOT NULL,
    user_id2 VARCHAR(8) NOT NULL,
    status VARCHAR(16) NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY(user_id1) REFERENCES Users(user_id),
    FOREIGN KEY(user_id2) REFERENCES Users(user_id)
    );
    
    
CREATE TABLE UserInterests (
	interest_id VARCHAR(8) PRIMARY KEY NOT NULL,
    user_id VARCHAR(8) NOT NULL,
    interest VARCHAR(32),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
    );