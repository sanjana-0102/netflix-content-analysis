-- Netflix Content Strategy Analysis - 10 Business Queries
-- Author: Sanjana

-- Q1: Movies vs TV Shows Count (Content Mix)
SELECT type, COUNT(*) AS total_count, 
       ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM netflix_titles),2) AS percentage
FROM netflix_titles
GROUP BY type;

-- Q2: Top 10 Countries by Content Production
SELECT primary_country AS country, COUNT(*) AS total_content
FROM netflix_titles
WHERE primary_country != 'Unknown'
GROUP BY primary_country
ORDER BY total_content DESC
LIMIT 10;

-- Q3: Content Added Per Year (Growth Trend) - Peak was 2019
SELECT year_added, COUNT(*) AS content_added
FROM netflix_titles
WHERE year_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

-- Q4: Top 10 Genres (What Netflix Invests In)
SELECT primary_genre AS genre, COUNT(*) AS total
FROM netflix_titles
GROUP BY primary_genre
ORDER BY total DESC
LIMIT 10;

-- Q5: Ratings Distribution (Target Audience)
SELECT rating, COUNT(*) AS total,
       ROUND(COUNT(*)*100.0/(SELECT COUNT(*) FROM netflix_titles),2) AS pct
FROM netflix_titles
WHERE rating != ''
GROUP BY rating
ORDER BY total DESC;

-- Q6: Top 10 Directors with Most Titles
SELECT director, COUNT(*) AS total_titles
FROM netflix_titles
WHERE director != 'Unknown'
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- Q7: Movies by Duration - Avg Movie Length
SELECT 
  CASE 
    WHEN duration_value < 60 THEN '< 60 min'
    WHEN duration_value BETWEEN 60 AND 120 THEN '60-120 min'
    ELSE '> 120 min'
  END AS duration_bucket,
  COUNT(*) AS movie_count
FROM netflix_titles
WHERE type = 'Movie'
GROUP BY duration_bucket
ORDER BY movie_count DESC;

-- Q8: Content Added by Month (Seasonality)
SELECT month_added, COUNT(*) AS total
FROM netflix_titles
WHERE month_added IS NOT NULL
GROUP BY month_added
ORDER BY total DESC;

-- Q9: Movies vs TV Shows Added Each Year
SELECT year_added, type, COUNT(*) AS total
FROM netflix_titles
WHERE year_added IS NOT NULL
GROUP BY year_added, type
ORDER BY year_added, type;

-- Q10: India vs USA Content Over Years (Regional Strategy)
SELECT year_added, primary_country, COUNT(*) AS total
FROM netflix_titles
WHERE primary_country IN ('United States', 'India', 'United Kingdom')
AND year_added IS NOT NULL
GROUP BY year_added, primary_country
ORDER BY year_added;
