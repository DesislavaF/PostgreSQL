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