-- 0 SELECT basics
-- 0.1 show the population of Germany.
SELECT population FROM world
 WHERE name = 'Germany';
-- 0.2 show the name and the population for 'Sweden', 'Norway', 'Denmark'.
SELECT name, population FROM world
 WHERE name IN ('Sweden', 'Norway', 'Denmark');
-- 0.3 show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
 WHERE area BETWEEN 200000 AND 250000;


-- 1 SELECT names
-- 1.1 Find the country that start with Y
SELECT name FROM world
 WHERE name LIKE 'Y%';
-- 1.2 Find the countries that end with y
SELECT name FROM world
 WHERE name LIKE '%Y';
-- 1.3 Find the countries that contain the letter x
SELECT name FROM world
 WHERE name LIKE '%X%';
-- 1.4 Find the countries that end with land
SELECT name FROM world
 WHERE name LIKE '%land';
-- 1.5 Find the countries that start with C and end with ia
SELECT name FROM world
 WHERE name LIKE 'C%%IA';
-- 1.6 Find the country that has oo in the name
SELECT name FROM world
 WHERE name LIKE '%OO%';
-- 1.7 Find the countries that have three or more a in the name
SELECT name FROM world
 WHERE name LIKE '%a%a%a%';
-- 1.8 Find the countries that have "t" as the second character.
SELECT name FROM world
 WHERE name LIKE '_T%'
ORDER BY name;
-- 1.9 Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
 WHERE name LIKE '%O__O%';
-- 1.10 Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____';
-- 1.11 Find the country where the name is the capital city.
SELECT name FROM world
 WHERE name = capital;
-- 1.12 Find the country where the capital is the country plus "City".
SELECT name FROM world
 WHERE capital = concat(name, ' City');
-- 1.13 Find the capital and the name where the capital includes the name of the country.
SELECT capital,name FROM world 
 WHERE capital LIKE concat('%', name, '%');
-- 1.14 Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name FROM world 
 WHERE capital LIKE concat('%', name, '%') AND capital > name;
-- 1.15 Show the name and the extension where the capital is an extension of name of the country.
SELECT name, REPLACE(capital, name, '') FROM world 
 WHERE capital LIKE concat('%', name, '%') AND capital > name;


-- 2 SELECT from WORLD Tutorial
-- 2.1 show the name, continent and population of all countries.
SELECT name, continent, population FROM world;
-- 2.2 Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
 WHERE population >= 200000000;
-- 2.3 Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name name, gdp/population per_capita_GDP FROM world
 WHERE population >= 200000000;
-- 2.4 Show the name and population in millions for the countries of the continent 'South America'.
SELECT name country, population/1000000 populations FROM world
 WHERE continent = 'South America';
-- 2.5 Show the name and population for France, Germany, Italy
SELECT name, population FROM world
 WHERE name IN ('France', 'Germany', 'Italy');
-- 2.6 Show the countries which have a name that includes the word 'United'
SELECT name FROM world
 WHERE name LIKE '%united%';
-- 2.7 Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area FROM world
 WHERE area > 3000000 OR population > 250000000;
-- 2.8 Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area
SELECT name, population,area FROM world
 WHERE(population>250000000 OR area>3000000)
  AND NOT(population>250000000 AND area>3000000);
-- 2.9 Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
SELECT name, ROUND(population/1000000,2),
             ROUND(gdp/1000000000,2)
  FROM world
 WHERE continent='South America';
-- 2.10 Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
SELECT name, ROUND(gdp/population,-3) FROM world
  WHERE gdp>1000000000000;
-- 2.11 Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital FROM world
 WHERE LENGTH(name) = LENGTH(capital);
-- 2.12 Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
SELECT name, capital FROM world
 WHERE LEFT(name,1) = LEFT(capital,1)
  AND NOT name = capital;
-- 2.13 Find the country that has all the vowels and no spaces in its name.
SELECT name FROM world 
 WHERE name LIKE '%a%'
  AND name LIKE '%e%'
   AND name LIKE '%i%'
    AND name LIKE '%o%'
     AND name LIKE '%u%'
      AND name NOT LIKE '% %';


-- 3 SELECT from Nobel Tutorial
-- 3.1 displays Nobel prizes for 1950.
SELECT yr, subject, winner FROM nobel
 WHERE yr = 1950
-- 3.2 Show who won the 1962 prize for Literature.
SELECT winner FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
-- 3.3 Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject FROM nobel
 WHERE winner = 'Albert Einstein';
-- 3.4 Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel
 WHERE subject = 'Peace' AND yr >= 2000;
-- 3.5 Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT * FROM nobel
 WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;
-- 3.6 Show all details of the presidential winners:Theodore Roosevelt, Woodrow Wilson, Jimmy Carter, Barack Obama
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter',
  'Barack Obama');
-- 3.7 Show the winners with first name John
SELECT winner FROM nobel
 WHERE winner LIKE 'John%';
-- 3.8 Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT * FROM nobel
 WHERE (subject LIKE ('Physics') AND yr = 1980) OR (subject LIKE ('Chemistry') AND yr = 1984);
-- 3.9 Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT * FROM nobel
 WHERE subject NOT LIKE ('Chemistry') AND subject NOT LIKE ('Medicine') AND yr = 1980;
-- 3.10 Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT * FROM nobel
  WHERE (subject LIKE ('Medicine') AND yr < 1910) OR (subject LIKE ('Literature') AND yr >= 2004);
-- 3.11 Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM nobel
  WHERE winner LIKE 'PETER GRÜNBERG';
-- 3.12 Find all details of the prize won by EUGENE O'NEILL
SELECT * FROM nobel
  WHERE winner LIKE 'EUGENE O''NEILL';
-- 3.13 List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'Sir%'
  ORDER BY yr DESC, winner; 


-- 4 SELECT within SELECT Tutorial
-- 4.1 List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
-- 4.2 Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp/population > (
  SELECT gdp/population
  FROM world
  WHERE name = 'United Kingdom');
-- 4.3 List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent FROM world 
WHERE continent IN (
 SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) 
ORDER BY name;
-- 4.4 Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world 
WHERE population > (
 SELECT population FROM world 
  WHERE name = 'Canada') 
AND population < (
 SELECT population FROM world 
 WHERE name = 'Poland');


-- 5 SUM and COUNT
-- 5.1 Show the total population of the world.
SELECT SUM(population) FROM world;
-- 5.2 List all the continents - just once each.
SELECT DISTINCT continent FROM world;
-- 5.3 Give the total GDP of Africa
SELECT SUM(gdp) FROM world 
 WHERE continent = 'Africa';
-- 5.4 How many countries have an area of at least 1000000
SELECT COUNT(name) FROM world 
 WHERE area >= 1000000;
-- 5.5 What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population) FROM world 
 WHERE name IN ('Estonia','Latvia','Lithuania');
-- 5.6 For each continent show the continent and number of countries.
SELECT continent, COUNT(name) FROM world 
 GROUP BY continent;
-- 5.7 For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name) FROM world 
 WHERE population >= 10000000 
 GROUP BY continent;
-- 5.8 List the continents that have a total population of at least 100 million.
SELECT continent FROM world 
 GROUP BY continent
 HAVING SUM(population) > 100000000









