-- create tables including entities and attributes
CREATE TABLE IF NOT EXISTS actors(
  actor_id SERIAL,
  first_name VARCHAR(50) not null,
  last_name VARCHAR(50) not null ,
  role_actor VARCHAR(200) not null,
  birthday DATE noT null,
  creation_dt DATE not null,
  modification_dt DATE not null,
  PRIMARY KEY(actor_id)
);

CREATE TABLE IF NOT EXISTS  directors(
  director_id SERIAL,
  first_name VARCHAR(50) not null,
  last_name VARCHAR(50) not null ,
  creation_dt DATE not null,
  modification_dt DATE not null,
  PRIMARY KEY(director_id)
);

CREATE TABLE IF NOT EXISTS  movies (

  movie_id SERIAL,
  title VARCHAR(200) NOT NULL,
  director_id INT,
  release_date DATE NOT NULL,
  duration INT NOT NULL,
  actor_id INT,
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

CREATE TABLE IF NOT EXISTS  users(
  user_id SERIAL,
  first_name VARCHAR(50) not null,
  last_name VARCHAR(50) not null ,
  email VARCHAR(250) not null unique,
  password_user VARCHAR(100) not null,
  role_user VARCHAR(100) not null,
  favorite_movies_list VARCHAR(100),
  creation_dt DATE not null,
  modification_dt DATE not null,
  PRIMARY KEY(user_id)
);

CREATE TABLE IF NOT EXISTS  watching(
  movie_id INT REFERENCES movies(movie_id),
  user_id INT REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS users_updates (
    update_id SERIAL PRIMARY KEY,
    user_id INT,
    change_date DATE,
    old_last_name VARCHAR(100),
    new_last_name VARCHAR(100),
    old_first_name VARCHAR(100),
    new_first_name VARCHAR(100),
    old_email VARCHAR(250),
    new_email VARCHAR(250),
    old_password VARCHAR(50),
    new_password VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);




-- Sample data for actors table

INSERT INTO actors (first_name,last_name,role_actor,birthday,creation_dt,modification_dt) VALUES
('John', 'Doe', 'Lead Actor', '1990-05-15', '2022-01-01', '2022-01-01'),
('Jane', 'Smith', 'Supporting Actor', '1985-08-20', '2022-01-01', '2022-01-01'),
('David', 'Johnson', 'Character Actor', '1978-03-10', '2022-01-01', '2022-01-01'),
('Emily', 'Williams', 'Lead Actress', '1992-11-25', '2022-01-01', '2022-01-01'),
('Robert', 'Miller', 'Supporting Actress', '1980-09-18', '2022-01-01', '2022-01-01'),
('Sophia', 'Anderson', 'Lead Actor', '1995-06-12', '2022-01-01', '2022-01-01'),
('Daniel', 'Brown', 'Supporting Actor', '1983-02-28', '2022-01-01', '2022-01-01'),
('Olivia', 'Smith', 'Character Actor', '1975-07-17', '2022-01-01', '2022-01-01'),
('James', 'Jones', 'Lead Actress', '1990-09-03', '2022-01-01', '2022-01-01'),
('Emma', 'Johnson', 'Supporting Actress', '1988-04-22', '2022-01-01', '2022-01-01'),
('William', 'White', 'Lead Actor', '1993-12-07', '2022-01-01', '2022-01-01'),
('Mia', 'Davis', 'Supporting Actor', '1981-11-14', '2022-01-01', '2022-01-01'),
('Ethan', 'Miller', 'Character Actor', '1970-06-29', '2022-01-01', '2022-01-01'),
('Ava', 'Anderson', 'Lead Actress', '1995-03-26', '2022-01-01', '2022-01-01'),
('Noah', 'Brown', 'Supporting Actress', '1987-10-11', '2022-01-01', '2022-01-01');

-- -- Sample data for directors table
INSERT INTO directors (first_name,last_name,creation_dt,modification_dt) VALUES
('Michael', 'Johnson', '2022-01-01', '2022-01-01'),
('Sarah', 'Clark', '2022-01-01', '2022-01-01'),
('Daniel', 'Brown', '2022-01-01', '2022-01-01'),
('Jessica', 'Davis', '2022-01-01', '2022-01-01'),
('Christopher', 'Smith', '2022-01-01', '2022-01-01'),
('Olivia', 'Miller', '2022-01-01', '2022-01-01'),
('Andrew', 'Williams', '2022-01-01', '2022-01-01'),
('Sophia', 'White', '2022-01-01', '2022-01-01'),
('Matthew', 'Anderson', '2022-01-01', '2022-01-01'),
('Ava', 'Jones', '2022-01-01', '2022-01-01'),
('James', 'Taylor', '2022-01-01', '2022-01-01'),
('Grace', 'Moore', '2022-01-01', '2022-01-01'),
('William', 'Martin', '2022-01-01', '2022-01-01'),
('Ella', 'Wilson', '2022-01-01', '2022-01-01'),
('Liam', 'Johnson', '2022-01-01', '2022-01-01');

-- -- Sample data for movies table

INSERT INTO movies (title,director_id,release_date,duration,actor_id,creation_dt,modification_dt) VALUES
('The Great Movie', 1, '2022-02-15', 120, 1, '2022-01-01', '2022-01-01'),
('Fantastic Film', 2, '2022-03-20', 150, 2, '2022-01-01', '2022-01-01'),
('Action Adventure', 3, '2022-05-10', 135, 3, '2022-01-01', '2022-01-01'),
('Romantic Comedy', 4, '2022-07-05', 110, 4, '2022-01-01', '2022-01-01'),
('Sci-Fi Thriller', 1, '2022-09-30', 160, 5, '2022-01-01', '2022-01-01'),
('Historical Drama', 2, '2022-11-15', 180, 1, '2022-01-01', '2022-01-01'),
('Comedy Action', 5, '2023-01-20', 125, 2, '2022-01-01', '2022-01-01'),
('Mystery Thriller', 6, '2023-03-15', 140, 3, '2022-01-01', '2022-01-01'),
('Family Animation', 7, '2023-05-10', 100, 4, '2022-01-01', '2022-01-01'),
('Fantasy Adventure', 8, '2023-07-05', 170, 5, '2022-01-01', '2022-01-01'),
('Drama Romance', 9, '2023-09-30', 155, 1, '2022-01-01', '2022-01-01'),
('Science Fiction', 10, '2023-11-15', 190, 2, '2022-01-01', '2022-01-01'),
('Action Comedy', 11, '2024-01-20', 130, 3, '2022-01-01', '2022-01-01'),
('Action Comedy2', 9, '2024-01-20', 150, 4, '2022-02-01', '2022-02-01');


-- -- Sample data for users table
INSERT INTO users (first_name,last_name,email,password_user,role_user,favorite_movies_list,creation_dt,modification_dt) VALUES
('Alice', 'Johnson', 'alice@email.com', 'password123', 'user', '1,2,3', '2022-01-01', '2022-01-01'),
('Bob', 'Smith', 'bob@email.com', 'password456', 'user', '2,4,5', '2022-01-01', '2022-01-01'),
('Charlie', 'Davis', 'charlie@email.com', 'password789', 'user', '3,5', '2022-01-01', '2022-01-01'),
('Diana', 'Miller', 'diana@email.com', 'passwordABC', 'admin', NULL, '2022-01-01', '2022-01-01'),
('Eva', 'Clark', 'eva@email.com', 'passwordDEF', 'admin', NULL, '2022-01-01', '2022-01-01'),
('Frank', 'Wilson', 'frank@email.com', 'passwordGHI', 'user', '1,4,5', '2022-01-01', '2022-01-01'),
('Grace', 'Moore', 'grace@email.com', 'passwordJKL', 'user', '2,3,5', '2022-01-01', '2022-01-01'),
('Henry', 'Taylor', 'henry@email.com', 'passwordMNO', 'admin', NULL, '2022-01-01', '2022-01-01'),
('Isabella', 'Brown', 'isabella@email.com', 'passwordPQR', 'admin', NULL, '2022-01-01', '2022-01-01'),
('Jack', 'Martin', 'jack@email.com', 'passwordSTU', 'user', '1,2,4', '2022-01-01', '2022-01-01'),
('Kayla', 'Anderson', 'kayla@email.com', 'passwordVWX', 'user', '3,5', '2022-01-01', '2022-01-01'),
('Liam', 'Moore', 'liam@email.com', 'passwordYZA', 'admin', NULL, '2022-01-01', '2022-01-01'),
('Mia', 'Jones', 'mia@email.com', 'passwordBCD', 'user', '2,4,5', '2022-01-01', '2022-01-01'),
('Nathan', 'Wilson', 'nathan@email.com', 'passwordEFG', 'user', '1,3,5', '2022-01-01', '2022-01-01'),
('Olivia', 'Smith', 'olivia@email.com', 'passwordHIJ', 'admin', NULL, '2022-01-01', '2022-01-01');

-- -- Sample data for watching table
INSERT INTO watching VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(4, 1),
(4, 4),
(5, 3),
(5, 5),
(6, 2),
(7, 3),
(7, 4),
(8, 1),
(9, 4),
(10, 2),
(10, 4),
(11, 1),
(12, 3),
(12, 5),
(13, 1),
(13, 2),
(14, 4),
(12, 3),
(11, 5);


-- create function to generate the date


CREATE OR REPLACE FUNCTION trigger_date()
RETURNS TRIGGER
AS $$
BEGIN
-- If the row is newly inserted, update the creation_dt column
IF TG_OP = 'INSERT' THEN
NEW.creation_dt := NOW();
END IF;

-- Always update the modification_dt column when inserting or updating

    NEW.modification_dt := NOW();

    RETURN NEW;

END;

$$
LANGUAGE plpgsql;


--  Create trigger function for users_updates


CREATE OR REPLACE FUNCTION users_updates()
RETURNS TRIGGER
AS $$
BEGIN
    -- Insert a new line in users updates with the changes
    INSERT INTO users_updates (
        user_id,
        change_date,
        old_last_name, new_last_name,
        old_first_name, new_first_name,
        old_email, new_email,
        old_password, new_password
    ) VALUES (
        NEW.user_id,
        CURRENT_DATE,
        OLD.last_name, NEW.last_name,
        OLD.first_name, NEW.first_name,
        OLD.email, NEW.email,
        OLD.password_user, NEW.password_user
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


--  Create trigger on UserTable


CREATE TRIGGER user_table_trigger
AFTER UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION users_updates();


--  Create trigger on actors


CREATE TRIGGER trigger_date
BEFORE INSERT OR UPDATE ON actors
FOR EACH ROW
EXECUTE FUNCTION trigger_date();
$$



--  Create trigger on movies
CREATE TRIGGER trigger_date
BEFORE INSERT OR UPDATE ON movies
FOR EACH ROW
EXECUTE FUNCTION trigger_date();


