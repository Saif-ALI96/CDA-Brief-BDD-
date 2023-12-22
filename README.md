# CDA-Brief-BDD

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
INSERT INTO movies (title,release_date,duration,creation_dt,modification_dt) VALUES
('Iron Man','2008-04-30', 126,'20232-12-22','2023-12-22');
```

#### add an actor/actress

```sql
INSERT INTO actors (first_name,last_name,role_actor,birthday,creation_dt,modification_dt)
VALUES
('Danial','Radcliffe','Harry Potter', '1989-07-23','2023-12-22','2023-12-22');
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
FROM acotrs a
ORDER BY creation_dt DESC
LIMIT 3;
```
