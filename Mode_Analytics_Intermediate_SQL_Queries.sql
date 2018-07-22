--Write a query to count the number of non-null rows in the low column.
select count(low) as "LOW" from tutorial.aapl_historical_stock_price where low is not null;

--Write a query that determines counts of every single column. Which column has the most null values?
select 
count(year) as "year_null",
count(month) as "month_null",
count(open) as "open_null",
count(high) as "high_null",
count(low) as "low_null",
count(close) as "close_null",
count(volume) as "volume_null"
from tutorial.aapl_historical_stock_price 
where date is null and year is null and month is null and open is null and high is null
and low is null and close is null and volume is null;

--Write a query to calculate the average opening price (hint: you will need to use both COUNT and SUM, as well as some simple arithmetic.). 
select (sum(open)/count(open)) as "average_open_price" from tutorial.aapl_historical_stock_price ;

--What was Apple's lowest stock price (at the time of this data collection)? 
select min(low) as "lowest_stock_price" from tutorial.aapl_historical_stock_price ;

--What was the highest single-day increase in Apple's share value? 
select max(close - open) as "lowest_stock_price" from tutorial.aapl_historical_stock_price ;

--Write a query that calculates the average daily trade volume for Apple stock. 
select avg(volume) as "avg_volume" from tutorial.aapl_historical_stock_price ;

--Calculate the total number of shares traded each month. Order your results chronologically. 
select year, month, sum(volume) as "shares_per_month" from tutorial.aapl_historical_stock_price group by year, month order by year, month;

--Write a query that calculates the lowest and highest prices that Apple stock achieved each month. 
select year, month, max(high) as "high_value", min(low) as "low_value" from tutorial.aapl_historical_stock_price group by 1,2 order by 1,2;

--Write a query that returns the unique values in the year column, in chronological order. 
select distinct(year) as "unique_year_values" from tutorial.aapl_historical_stock_price order by year;

--Write a query that returns the unique values in the year column, in chronological order. 
select distinct(year) as "unique_year_values" from tutorial.aapl_historical_stock_price order by year;

--Write a query that counts the number of unique values in the month column for each year. 
select count(distinct(month)), year from tutorial.aapl_historical_stock_price group by year order by year;

--Write a query that separately counts the number of unique values in the month column and the number of unique values in the `year` column. 
select count(distinct(year)) as "distinct_year", count(distinct(month)) as "distinct_month" from tutorial.aapl_historical_stock_price;

--Write a query that includes players' names and a column that classifies them into four categories based on height. Keep in mind that the answer we provide is only one of many possible answers, since you could divide players' heights in many ways. 
select player_name,
CASE 
WHEN height <= 20 THEN 'Category A'
WHEN height > 21 and height <=40 THEN'Category B'
WHEN height > 41 and height <=60 THEN 'Category C'
WHEN height > 61 THEN 'Category D' END AS weight_group
from benn.college_football_players order by weight_group ;

--Write a query that selects all columns from benn.college_football_players and adds an additional column that displays the player's name if that player is a junior or senior. 
select player_name,
CASE 
WHEN year = 'JR' THEN 'JUNIOR'
WHEN year = 'SR' THEN 'SENIOR' 
ELSE 'NEITHER FR NOR SR' END AS junior_senior
from benn.college_football_players ;

--Write a query that counts the number of 300lb+ players for each of the following regions: West Coast (CA, OR, WA), Texas, and Other (Everywhere else). 
select CASE 
WHEN state in ('CA', 'OR', 'WA') THEN 'West Coast'
WHEN state = 'TX' THEN 'Texas'
ELSE 'Other' END AS players_by_state,
count(1) as players
from benn.college_football_players 
where weight >= 300
group by 1 order by players;

--Write a query that calculates the combined weight of all underclass players (FR/SO) in California as well as the combined weight of all upperclass players (JR/SR) in California.
select CASE
when year in ('FR','SO') then 'underclass'
when year in ('JR','SR') then 'upperclass'
end as class_group,
sum(weight) as combined_weight
from benn.college_football_players 
where state = 'CA'
group by 1;

--Write a query that selects the school name, player name, position, and weight for every player in Georgia, ordered by weight (heaviest to lightest). Be sure to make an alias for the table, and to reference all column names in relation to the alias. 
select 
players.school_name,
players.player_name,
players.position,
players.weight
from benn.college_football_players players
where state = 'GA'
order by players.weight;

-- Write a query that displays player names, school names and conferences for schools in the "FBS (Division I-A Teams)" division. 
select player.player_name, player.school_name, teams.conference from benn.college_football_players as player
inner join benn.college_football_teams as teams on player.school_name = teams.school_name 
where teams.division = 'FBS (Division I-A Teams)';

-- Write a query that performs an inner join between the tutorial.crunchbase_acquisitions table and the tutorial.crunchbase_companies table, but instead of listing individual rows, count the number of non-null rows in each table. 
select count(comp.permalink) as comp_permalink, count(acq.company_permalink) as acq_permalink 
from tutorial.crunchbase_companies 
as comp inner join tutorial.crunchbase_acquisitions as acq 
on comp.permalink = acq.company_permalink;

-- Modify the query above to be a LEFT JOIN. Note the difference in results. 
select count(comp.permalink) as comp_permalink, count(acq.company_permalink) as acq_permalink 
from tutorial.crunchbase_companies 
as comp left join tutorial.crunchbase_acquisitions as acq 
on comp.permalink = acq.company_permalink

-- Count the number of unique companies (don't double-count companies) and unique acquired companies by state. Do not include results for which there is no state data, and order by the number of acquired companies from highest to lowest. 
select comp.state_code, count(distinct(comp.permalink)) as c1, count(distinct(acq.company_permalink)) as c2
from tutorial.crunchbase_companies as comp
left join
tutorial.crunchbase_acquisitions as acq
on
comp.permalink = acq.company_permalink
where
comp.state_code is not null 
group by 1
order by c2 desc;

-- Rewrite the previous practice query in which you counted total and acquired companies by state, but with a RIGHT JOIN instead of a LEFT JOIN. The goal is to produce the exact same results. 
select comp.state_code, count(distinct(comp.permalink)) as c1, count(distinct(acq.company_permalink)) as c2
from tutorial.crunchbase_companies as comp
right join
tutorial.crunchbase_acquisitions as acq
on
comp.permalink = acq.company_permalink
where
comp.state_code is not null 
group by 1
order by c2 desc;

-- Write a query that shows a company's name, "status" (found in the Companies table), and the number of unique investors in that company. Order by the number of investors from most to fewest. Limit to only companies in the state of New York. 
select comp.name as comp_name, comp.status as comp_status, count(distinct(inv.investor_name)) as inv
from tutorial.crunchbase_companies as comp
left join
tutorial.crunchbase_investments as inv
on
comp.permalink = inv.company_permalink
where comp.state_code = 'NY'
group by 1, 2
order by 3 desc;

-- Write a query that lists investors based on the number of companies in which they are invested. Include a row for companies with no investor, and order from most companies to least. 
select investor_name, count(investor_name)
from tutorial.crunchbase_investments 
group by investor_name
order by 2 desc;

-- Write a query that joins tutorial.crunchbase_companies and tutorial.crunchbase_investments_part1 using a FULL JOIN. Count up the number of rows that are matched/unmatched as in the example above. 
select count(comp.permalink) as c1, count(inv.company_permalink) as c2
from tutorial.crunchbase_companies as comp
full join
tutorial.crunchbase_investments_part1 as inv
on comp.permalink = inv.company_permalink
 
-- Write a query that joins tutorial.crunchbase_companies and tutorial.crunchbase_investments_part1 using a FULL JOIN. Count up the number of rows that are matched/unmatched as in the example above. 
select count(comp.permalink) as c1, count(inv.company_permalink) as c2
from tutorial.crunchbase_companies as comp
full join
tutorial.crunchbase_investments_part1 as inv
on comp.permalink = inv.company_permalink
 
-- Write a query that joins tutorial.crunchbase_companies and tutorial.crunchbase_investments_part1 using a FULL JOIN. Count up the number of rows that are matched/unmatched as in the example above. 
select count(comp.permalink) as c1, count(inv.company_permalink) as c2
from tutorial.crunchbase_companies as comp
full join
tutorial.crunchbase_investments_part1 as inv
on comp.permalink = inv.company_permalink
 
https://w3resource.com/sql/question-answer.php	

--Write a query that appends the two crunchbase_investments datasets above (including duplicate values). Filter the first dataset to only companies with names that start with the letter "T", and filter the second to companies with names starting with "M" (both not case-sensitive). Only include the company_permalink, company_name, and investor_name columns. 
select company_permalink, company_name, investor_name from tutorial.crunchbase_investments_part1 where investor_name like 'T%'
union all 
select company_permalink, company_name, investor_name from tutorial.crunchbase_investments_part2 where investor_name like 'M%';

--Write a query that shows 3 columns. The first indicates which dataset (part 1 or 2) the data comes from, the second shows company status, and the third is a count of the number of investors. 
SELECT 'investments_part1' AS dataset_name,
       companies.status,
       COUNT(DISTINCT investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part1 investments
    ON companies.permalink = investments.company_permalink
 GROUP BY 1,2

 UNION ALL
 
 SELECT 'investments_part2' AS dataset_name,
       companies.status,
       COUNT(DISTINCT investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part2 investments
    ON companies.permalink = investments.company_permalink
 GROUP BY 1,2
 
