# CDA-Brief-BDD / NetStream

### Docker container - PostgreSQL DataBase

To run the docker container with the PostgreSQL database you need to install :

- Docker
- Git
- An SQL Client

Please follow this steps to run the container :

- git clone the repo
- run this command in a console (be careful of the directory) :

```bash
docker compose up
```

### SQL Requests

#### Titles and release dates of films from newest to oldest

```sql
SELECT title , release_date
FROM movies m
ORDER BY release_date DESC;
```

#### The names, first names and ages of actors/actresses over 30 years in alphabetical order

```sql
SELECT
    first_name,
    last_name,
    birthday,
    AGE(CURRENT_DATE, birthday) AS age
FROM
    actors
WHERE
    AGE(CURRENT_DATE, birthday) > interval '30 years'
ORDER BY
    last_name,first_name;
```

#### La liste des acteurs/actrices principaux pour un film donné

```sql
SELECT
    m.title, a.first_name , a.last_name , a.role_actor
FROM
    movies m
left JOIN
    actors a  ON (m.actor_id  = a.actor_id);
```

#### The list of films for a given actor/actress

```sql
SELECT
    m.title,
    m.release_date,
    a.first_name,
    a.last_name,
    a.role_actor
FROM
    movies m
JOIN
    actors a ON (m.actor_id = a.actor_id)
WHERE
    a.first_name = 'Robert' AND a.last_name = 'Miller';
```

#### add one movie

```sql
INSERT INTO movies (title,release_date,duration) VALUES
('Iron Man','2008-04-30', 126);
```

#### add an actor/actress

```sql
INSERT INTO actors (first_name,last_name,role_actor,birthday)
VALUES
('Danial','Radcliffe','Harry Potter', '1989-07-23');
```

#### Edit a movie

```sql
UPDATE movies
SET title = 'Harry Potter'
WHERE movie_id = 4;
```

#### Delete an actor/actress

```sql
DELETE FROM actors
WHERE first_name = 'Mia';
```

#### Show last 3 actors/actresses added

```sql
SELECT *
FROM actors a
ORDER BY creation_dt DESC
LIMIT 3;
```

## Advanced SQL Requests

#### Call the stored procedure to get films by Christopher Smith :

```sql
SELECT
    m.title,
    m.director_id,
    d.first_name,
    d.last_name
FROM
    movies m
INNER JOIN
    directors d on (m.director_id = d.director_id)
where
    m.director_id= 5;
```

#### Update users :

```sql
UPDATE users
SET first_name = 'ceile', last_name ='johan' , password_user = 344564454534
WHERE user_id = 8;
```

#### Select all records in the update table :

```sql
select * from users_updates uu ;
```
