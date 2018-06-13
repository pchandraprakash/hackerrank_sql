--Weather Observation Station 3
select unique(city) from station where mod(id,2)=0;