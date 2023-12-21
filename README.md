# CDA-Brief-BDD

Titles and release dates of films from newest to oldest

```sql
SELECT title , release_date
FROM movies m
ORDER BY release_date DESC;
```

The names, first names and ages of actors/actresses over 30 years in alphabetical order

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
