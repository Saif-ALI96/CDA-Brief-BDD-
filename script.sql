-- create tables including entities and attributes

CREATE TABLE movies (

    movie_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    director_id INT NOT NULL,
    release_date DATE NOT NULL,
    duration INT NOT NULL,
    actor_id INT NOT NULL,
    creation_dt DATE NOT NULL,
    modification_dt DATE NOT NULL,
    PRIMARY KEY (movie_id),
    CONSTRAINT fk_actors_movies
        FOREIGN KEY (actor_id)
        REFERENCES actors (actor_id),
    CONSTRAINT fk_directors_movies
        FOREIGN KEY (director_id)
        REFERENCES directors (director_id)

);

create table actors(
actor_id INT not null ,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null ,
role_actor VARCHAR(200) not null,
birthday DATE noT null,
creation_dt DATE not null,
modification_dt DATE not null,
PRIMARY KEY(actor_id),
);

create table directors(
director_id INT not null ,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null ,
creation_dt DATE not null,
modification_dt DATE not null,
PRIMARY KEY(director_id),
);

CREATE TABLE movies (
movie_id INT NOT NULL,
title VARCHAR(200) NOT NULL,
director_id INT NOT NULL,
release_date DATE NOT NULL,
duration INT NOT NULL,
actor_id INT NOT NULL,
creation_dt DATE NOT NULL,
modification_dt DATE NOT NULL,
PRIMARY KEY (movie_id),
CONSTRAINT fk_actors_movies
FOREIGN KEY (actor_id)
REFERENCES actors (actor_id),
CONSTRAINT fk_directors_movies
FOREIGN KEY (director_id)
REFERENCES directors (director_id)
);

create table users(
user_id INT not null ,
first_name VARCHAR(50) not null,
last_name VARCHAR(50) not null ,
email VARCHAR(250) not null,
password_user VARCHAR(100) not null,
role_user VARCHAR(100) not null,
favorite_movies_list VARCHAR(100),
creation_dt DATE not null,
modification_dt DATE not null,
PRIMARY KEY(user_id)
);

CREATE TABLE watching(
movie_id INT REFERENCES movies(movie_id),
user_id INT REFERENCES users(user_id)
);
