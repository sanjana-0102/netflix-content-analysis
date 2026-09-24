-- Netflix Content Analysis - 10 Business Questions

-- 1. Count of Movies vs TV Shows
SELECT type, COUNT(*) as count FROM netflix GROUP BY type;

-- 2. Top 10 Countries with most content
SELECT country, COUNT(*) as total_content 
FROM netflix 
WHERE country != 'Unknown' AND country IS NOT NULL
GROUP BY country ORDER BY total_content DESC LIMIT 10;

-- 3. Content added per year (Growth Trend)
SELECT YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) as year_added, COUNT(*) as count
FROM netflix WHERE date_added IS NOT NULL
GROUP BY year_added ORDER BY year_added;

-- 4. Most common rating for Movies and TV Shows
SELECT type, rating, COUNT(*) as count FROM netflix
GROUP BY type, rating ORDER BY type, count DESC;

-- 5. Top 10 Directors
SELECT director, COUNT(*) as total FROM netflix
WHERE director != 'Unknown' GROUP BY director ORDER BY total DESC LIMIT 10;

-- 6. List all Movies released in a specific year (e.g., 2020)
SELECT title, release_year FROM netflix 
WHERE type='Movie' AND release_year=2020;

-- 7. Top 10 Genres (primary genre)
SELECT listed_in, COUNT(*) as count FROM netflix
GROUP BY listed_in ORDER BY count DESC LIMIT 10;

-- 8. Find content added in last 1 year
SELECT * FROM netflix 
WHERE STR_TO_DATE(date_added, '%M %d, %Y') >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 9. Average release year for Movies vs TV Shows
SELECT type, AVG(release_year) as avg_year FROM netflix GROUP BY type;

-- 10. Movies that are Documentaries
SELECT title, listed_in FROM netflix 
WHERE listed_in LIKE '%Documentaries%';
