create table program_user(
	id serial not null primary key,
	login varchar(20) not null,
	password varchar(20) not null,
	role varchar(20) not null,
	is_active bool not null
)