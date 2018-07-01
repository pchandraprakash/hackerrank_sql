-- Write a query to select all of the columns in the tutorial.us_housing_units table without using *.
select year, month, west, month_name, midwest, south, northeast from tutorial.us_housing_units;

--Write a query to select all of the columns in tutorial.us_housing_units and rename them so that their first letters are capitalized.
select
year AS "Year",
month AS "Month",
west AS "West",
month_name AS "Month_Name",
midwest AS "Midwest",
south AS "South",
northeast AS "Northeast"
from tutorial.us_housing_units

--Write a query that uses the LIMIT command to restrict the result set to only 15 rows.
select * from tutorial.us_housing_units limit 15;

--Did the West Region ever produce more than 50,000 housing units in one month?
select * from tutorial.us_housing_units where west > 50;

--Did the South Region ever produce 20,000 or fewer housing units in one month?
select south from tutorial.us_housing_units where south<=20;

--Write a query that only shows rows for which the month name is February.
select * from tutorial.us_housing_units where month_name = 'February';

--Write a query that only shows rows for which the month_name starts with the letter "N" or an earlier letter in the alphabet.
select * from tutorial.us_housing_units where month_name < 'O';
select * from tutorial.us_housing_units where month_name <= 'N';

--Write a query that calculates the sum of all four regions in a separate column.
select round(south+west+midwest+northeast) as "overall_units" from tutorial.us_housing_units; 

--Write a query that returns all rows for which more units were produced in the West region than in the Midwest and Northeast combined.
select west from tutorial.us_housing_units where west > (midwest+northeast);

--Write a query that calculates the percentage of all houses completed in the United States represented by each region. Only return results from the year 2000 and later. 
select 
(west/(west+south+midwest+northeast))*100 as "west_percentage",
(south/(west+south+midwest+northeast))*100 as "south_percentage",
(midwest/(west+south+midwest+northeast))*100 as "midwest_percentage",
(northeast/(west+south+midwest+northeast))*100 as "northeast_percentage"
from tutorial.us_housing_units 
where year >= 2000;

--Write a query that returns all rows for which Ludacris was a member of the group.
select * from tutorial.billboard_top_100_year_end where "group" ilike '%ludacris%';

--Write a query that returns all rows for which the first artist listed in the group has a name that begins with "DJ".
select * from tutorial.billboard_top_100_year_end where "group" ilike 'dj%';

--Write a query that shows all of the entries for Elvis and M.C. Hammer. 
select count(*) from tutorial.billboard_top_100_year_end 
where "group" ilike 'M.C. Hammer%' or 
"group" ilike '%M.C. Hammer%' or
"group" ilike 'Hammer%' or
"group" ilike '%Hammer%' or
"group" ilike '%Elvis%' or
"group" ilike 'Elvis%';

select * from tutorial.billboard_top_100_year_end where "group" in ('M.C. Hammer', 'Hammer', 'Elvis Presley')
 
--Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990.
select * from tutorial.billboard_top_100_year_end where year between 1985 and 1990;

--Write a query that shows all of the rows for which song_name is null.
select * from tutorial.billboard_top_100_year_end where song_name is null;

--Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.
select * from tutorial.billboard_top_100_year_end where year_rank<=10 and "group" ilike '%ludacris%';

--Write a query that surfaces the top-ranked records in 1990, 2000, and 2010
select * from tutorial.billboard_top_100_year_end where year_rank = 1 and year in (1990,2000,2010);

--Write a query that lists all songs from the 1960s with "love" in the title.
select * from tutorial.billboard_top_100_year_end where year between 1960 and 1969 and (song_name ilike '%love%' or song_name ilike 'love%');

--Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi.
select * from tutorial.billboard_top_100_year_end where year_rank <=10 and ("group" ilike '%katy perry%' or "group" ilike '%bon jovi%');

--Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.
select * from tutorial.billboard_top_100_year_end where "group" ilike '%dr. dre%' and (year <=2001 or year >=2009);

--Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a".
select * from tutorial.billboard_top_100_year_end where year = 2013 and song_name not ilike '%a%';

--Write a query that returns all rows from 2012, ordered by song title from Z to A.
select * from tutorial.billboard_top_100_year_end where year = 2012 order by song_name desc;

--Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song.
select * from tutorial.billboard_top_100_year_end where year = 2010 order by year_rank, artist;

--Write a query that shows all rows for which T-Pain was a group member, ordered by rank on the charts, from lowest to highest rank (from 100 to 1).
select * from tutorial.billboard_top_100_year_end where "group" ilike '%t-pain%' order by year_rank desc;

/* Write a query that returns songs that ranked between 10 and 20 (inclusive) 
in 1993, 2003, or 2013. Order the results by year and rank, and leave a comment 
on each line of the WHERE clause to indicate what that line does */
select * from tutorial.billboard_top_100_year_end 
where year_rank between 10 and 20 -- select relevant year_rank
and year in (1993,2003,2013) -- select relevant years
order by year, year_rank;
