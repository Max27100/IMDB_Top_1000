Select *
From PortfolioIMDB..imdb_top_1000

Select * 
From PortfolioIMDB..imdb_top_1000_Meta

--Movies that have a rating of 8.5 or higher on IMDB
Select Series_Title, IMDB_Rating 
From PortfolioIMDB..imdb_top_1000
Where IMDB_Rating >= 8.5

--Movies that have a rating of 85 or higher on Metacritic
Select Series_Title, Meta_score
From PortfolioIMDB..imdb_top_1000_Meta
Where Meta_score >= 85
order by Meta_score desc

--Condensing Dataset
Select imdb.Series_Title, imdb.Released_Year, imdb.Certificate, imdb.Runtime, imdb.Genre, imdb.IMDB_Rating, meta.Meta_score,
meta.Director, meta.Star1, meta.Star2, meta.Star3, meta.Star4, meta.No_of_Votes, meta.Gross
From PortfolioIMDB..imdb_top_1000 imdb
Join PortfolioIMDB..imdb_top_1000_Meta meta
on imdb.Series_Title = meta.Series_Title


--Amount of movies in IMDB Top 100 that are directed by Christopher Nolan
Select imdb.Series_Title, imdb.Released_Year, imdb.Certificate, imdb.Runtime, imdb.Genre, imdb.IMDB_Rating, meta.Meta_score,
meta.Director, meta.Star1, meta.Star2, meta.Star3, meta.Star4, meta.No_of_Votes, meta.Gross
From PortfolioIMDB..imdb_top_1000 imdb
Join PortfolioIMDB..imdb_top_1000_Meta meta
on imdb.Series_Title = meta.Series_Title
where meta.Director = 'Christopher Nolan'
order by imdb.IMDB_Rating desc

--Amount of movies in IMDB Top 1000 that star Samuel L. Jackson
Select imdb.Series_Title, imdb.Released_Year, imdb.Certificate, imdb.Runtime, imdb.Genre, imdb.IMDB_Rating, meta.Meta_score,
meta.Director, meta.Star1, meta.Star2, meta.Star3, meta.Star4, meta.No_of_Votes, meta.Gross
From PortfolioIMDB..imdb_top_1000 imdb
Join PortfolioIMDB..imdb_top_1000_Meta meta
on imdb.Series_Title = meta.Series_Title
where meta.Star1 = 'Samuel L. Jackson' or meta.Star2 = 'Samuel L. Jackson' or meta.star3 = 'Samuel L. Jackson' or meta.star4 = 'Samuel L. Jackson'
order by imdb.IMDB_Rating desc


--Actors with the most movies in a starring role in the top 1000
SELECT TOP 5 Star1, count(Star1) AS 'Num of Star'
FROM PortfolioIMDB..imdb_top_1000_Meta
GROUP BY Star1
ORDER BY'Num of Star' DESC

--Actors with the most movies in the top 1000
Select Star, count(*) 
From (select Star1 as Star from PortfolioIMDB..imdb_top_1000_Meta 
union all
Select Star2 as Star from PortfolioIMDB..imdb_top_1000_Meta
union all 
Select Star3 as Star from PortfolioIMDB..imdb_top_1000_Meta) Star
group by Star
order by 2 desc


--Genre with the most movies in the top 1000
SELECT TOP 5 Genre, count(Genre) AS 'Num of Genre'
FROM PortfolioIMDB..imdb_top_1000
GROUP BY Genre
ORDER BY'Num of Genre' Desc


--Year with the most films in the top 1000
SELECT TOP 5 Released_Year, count(Released_Year) AS 'Num of Year'
FROM PortfolioIMDB..imdb_top_1000
GROUP BY Released_Year
ORDER BY'Num of Year' Desc

--Movies sorted by number of votes
SELECT Series_Title, No_of_Votes
FROM PortfolioIMDB..imdb_top_1000_Meta
GROUP BY Series_Title, No_of_Votes
ORDER BY No_of_Votes Desc

--Top 5 movies with the most votes
SELECT TOP 5 Series_Title, No_of_Votes
FROM PortfolioIMDB..imdb_top_1000_Meta
GROUP BY Series_Title, No_of_Votes
ORDER BY No_of_Votes Desc

