SELECT *
From IMDB250MoviesIMDB250Moviescsv;

---Change Table Name---

ALTER TABLE IMDB250MoviesIMDB250Moviescsv RENAME TO Movies;

SELECT *
From Movies;

---Top 5 Budgeted Movies---Movies

Select name, budget
FROM Movies
ORDER BY budget DESC 
LIMIT 5;

---Update to USD---

UPDATE Movies
SET
budget = REPLACE(budget, 2400000000, 23500000);

UPDATE Movies
SET
budget = REPLACE(budget,550000000, 6648000);

SELECT name, budget
FROM Movies
ORDER BY name;

---Top 10 Rated Movies---

SELECT name, rating
FROM Movies 
LIMIT 10;

---Top 5 Box Office Hits---
SELECT name, box_office
FROM Movies
Order By box_office DESC
LIMIT 5;

---Top 5 Profitable movies---

SELECT name, budget, box_office, (box_office-budget) AS 'Profit'
FROM Movies
ORDER BY Profit DESC
LIMIT 5;

---Most Popular Director---

SELECT directors, COUNT(*) AS 'Number' 
FROM Movies
GROUP BY directors
ORDER BY Number DESC 
LIMIT 10;

---Amount of Movies Per Certifricate---
SELECT certificate, COUNT(*) AS 'Number' 
FROM Movies
GROUP BY certificate
ORDER BY Number DESC 
LIMIT 10;

---Best Years for Moives---

SELECT year, COUNT(*) AS 'Number'
FROM Movies
GROUP BY year
Order BY Number DESC 
lIMIT 10;

---Most Popular Genre---
SELECT genre
FROM Movies;

SELECT genre, COUNT(*) AS 'genre_count'
FROM(
  SELECT trim(value) AS genre 
  FROM Movies
  CROSS JOIN json_each('["' || REPLACE(genre, ',', '","') || '"]')
  )
  GROUP BY genre
  ORDER BY genre_count DESC 
  Limit 10;
  
  ---Add Minute Column---
  
  SELECT run_time
  FROM Movies;
  
  ALTER TABLE Movies
  ADD minutes as (run_time*60);
  
  SELECT run_time, minutes
  FROM Movies;
  
  ---Amount of Movies Per Decade---
  
  SELECT
  	year/10*10+1 as decade_start,
    year/10*10+10 as decade_end,
    count(year) as number
 from Movies
 group by year/10
 order by decade_start;