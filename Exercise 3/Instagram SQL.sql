create table "user" (
	id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	username VARCHAR(50) not null,
	email VARCHAR(250) not null unique,
	password VARCHAR(250) not null
);

create table followers (
	follower_id bigint not null,
	following_id bigint not null,
	primary key (follower_id, following_id),
	foreign key (follower_id) references "user"(id) on delete cascade,
	foreign key (following_id) references "user"(id) on delete cascade
);

create table post (
	id bigint primary key GENERATED ALWAYS AS identity,
	user_id bigint not null,
	title varchar(250),
	description varchar(250),
	foreign key (user_id) references "user"(id) on delete cascade
);

create table content (
	id bigint primary key GENERATED ALWAYS AS identity,
	file varchar(255) not null,
	post_id bigint not null,
	foreign key (post_id) references post(id) on delete cascade
);

create table reaction (
	id int primary key generated always as identity,
	image varchar(255) not null
);

create table post_reaction (
	post_id bigint not null,
	reaction_id int not null,
	primary key (post_id, reaction_id),
	foreign key (post_id) references post(id) on delete cascade,
	foreign key (reaction_id) references reaction(id) on delete cascade
);

create table comment (
	id bigint primary key generated always as identity,
	post_id bigint not null,
	comment_id bigint,
	text varchar(255),
	foreign key (post_id) references post(id) on delete cascade,
	foreign key (comment_id) references comment(id) on delete cascade
);

create table comment_reaction (
	comment_id bigint not null,
	reaction_id int not null,
	primary key (comment_id, reaction_id),
	foreign key (comment_id) references comment(id) on delete cascade,
	foreign key (reaction_id) references reaction(id) on delete cascade
);

INSERT INTO reaction (image) VALUES
('like'), ('love'), ('haha'), ('wow'), ('sad'), ('angry'),
('clap'), ('celebrate'), ('question'), ('star'),
('fire'), ('thumbs_up'), ('heart'), ('laugh'), ('cry'),
('smile'), ('thumbs_down'), ('confused'), ('thinking'), ('party');

INSERT INTO "user" (username, email, password) VALUES
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2'),
('user3', 'user3@example.com', 'password3'),
('user4', 'user4@example.com', 'password4'),
('user5', 'user5@example.com', 'password5'),
('user6', 'user6@example.com', 'password6'),
('user7', 'user7@example.com', 'password7'),
('user8', 'user8@example.com', 'password8');

INSERT INTO post (user_id, title, description) VALUES
(1, 'Post 1 Title', 'Post 1 Description'),
(1, 'Post 2 Title', 'Post 2 Description'),
(1, 'Post 3 Title', 'Post 3 Description'),
(2, 'Post 4 Title', 'Post 4 Description'),
(2, 'Post 5 Title', 'Post 5 Description'),
(3, 'Post 6 Title', 'Post 6 Description'),
(3, 'Post 7 Title', 'Post 7 Description'),
(4, 'Post 8 Title', 'Post 8 Description'),
(4, 'Post 9 Title', 'Post 9 Description'),
(5, 'Post 10 Title', 'Post 10 Description'),
(5, 'Post 11 Title', 'Post 11 Description'),
(6, 'Post 12 Title', 'Post 12 Description'),
(6, 'Post 13 Title', 'Post 13 Description'),
(7, 'Post 14 Title', 'Post 14 Description'),
(7, 'Post 15 Title', 'Post 15 Description'),
(8, 'Post 16 Title', 'Post 16 Description');

SELECT * FROM reaction;

SELECT * FROM "user";

SELECT * FROM post;


INSERT INTO post_reaction (post_id, reaction_id) VALUES
(17, 1), (17, 2), 
(18, 3), (18, 4), 
(19, 5), (19, 6), 
(20, 7), (20, 8), 
(21, 9), (21, 10), 
(22, 11), (22, 12), 
(23, 13), (23, 14), 
(24, 15), (24, 16), 
(25, 17), (25, 18), 
(26, 19), (26, 1), 
(27, 2), (27, 3), 
(28, 4), (28, 5), 
(29, 6), (29, 7), 
(30, 8), (30, 9), 
(31, 10), (31, 11),
(32, 12), (32, 13); 


INSERT INTO comment (post_id, comment_id, text) VALUES
(17, NULL, 'First comment'),
(17, NULL, 'Second comment'),
(18, NULL, 'Another comment'),
(19, NULL, 'General comment'),
(20, NULL, 'Feedback'),
(21, NULL, 'Great post!'),
(22, NULL, 'Loved it'),
(23, NULL, 'Not sure about this'),
(24, NULL, 'Interesting idea'),
(25, NULL, 'Could be better'),
(26, NULL, 'Fantastic!'),
(27, NULL, 'Liked it'),
(28, NULL, 'Okay'),
(29, NULL, 'Needs work'),
(30, NULL, 'Amazing'),
(31, NULL, 'Not bad'),
(32, NULL, 'Could improve'),
(32, NULL, 'Love it');

SELECT * FROM comment;


INSERT INTO comment_reaction (comment_id, reaction_id) VALUES
(41, 1), 
(42, 2),  
(43, 3),  
(44, 4),  
(45, 5), 
(46, 6),  
(47, 7),  
(48, 8),  
(49, 9),  
(50, 10), 
(51, 11),
(52, 12), 
(53, 13),
(54, 14), 
(55, 15), 
(56, 16), 
(57, 17), 
(58, 18); 

SELECT * FROM comment;


SELECT * FROM reaction WHERE id = 1;
SELECT id FROM comment WHERE text = 'First comment';
SELECT * FROM reaction WHERE image = 'like';
SELECT * FROM comment WHERE text LIKE '%comment%';



SELECT p.id AS post_id, r.image AS reaction
FROM post_reaction pr
JOIN reaction r ON pr.reaction_id = r.id
JOIN post p ON pr.post_id = p.id;


SELECT c.id AS comment_id, r.image AS reaction
FROM comment_reaction cr
JOIN reaction r ON cr.reaction_id = r.id
JOIN comment c ON cr.comment_id = c.id;



ALTER TABLE post 
ADD COLUMN adds_budget INT,
ADD COLUMN is_story BOOLEAN,
ADD COLUMN expire_at DATE;

CREATE TABLE share (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    shared_by BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    description VARCHAR(250),
    FOREIGN KEY (shared_by) REFERENCES "user"(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES post(id) ON DELETE CASCADE
);

ALTER TABLE comment 
ADD COLUMN adds_budget INT;

INSERT INTO share (shared_by, post_id, description) VALUES
(1, 17, 'Check this out!'),
(2, 18, 'Interesting post!'),
(3, 19, 'Sharing this for later.'),
(4, 20, 'Must read!');


ALTER TABLE comment
ADD COLUMN commented_by BIGINT;


UPDATE comment 
SET commented_by = 1
WHERE commented_by IS NULL;

ALTER TABLE comment 
ALTER COLUMN commented_by SET NOT NULL;

ALTER TABLE comment 
ADD FOREIGN KEY (commented_by) REFERENCES "user"(id) ON DELETE CASCADE;

INSERT INTO comment (post_id, comment_id, commented_by, text) VALUES
(17, NULL, 1, 'First comment'),
(17, NULL, 2, 'Second comment'),
(18, NULL, 3, 'Another comment'),
(19, NULL, 4, 'General comment');

