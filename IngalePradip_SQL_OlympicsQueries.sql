create database sql_project;

use sql_project;

select * from athlete;

/* Q1. Show how many medal counts present for entire data.*/

select Medal, count(Medal) as Meadal_Count 
from athlete 
where Medal != 'NoMedal' 
group by Medal;

/* Q2. Show count of unique Sports are present in olympics. */

select sport as Unique_Sports_Are_Present_in_Olympics 
from athlete 
group by sport;

/* Q3. Show how many different medals won by Team India in data. */

select Medal, count(Medal) as Medal_Won_by_India 
from athlete 
where Team = 'India' and Medal != 'NoMedal' 
group by Medal;

/* Q4. Show event wise medals won by india show from highest to lowest medals won in order. */

select Event, Team, Medal, count(Medal) as Medal_Won 
from Athlete  
where Team = 'India' and Medal != 'NoMedal' 
group by Event, Medal;

/* Q5. Show event and yearwise medals won by india in order of year.*/

select Event, Year, Team, Medal 
from Athlete  
where Team = 'India' and Medal != 'NoMedal'
order by Year;


/* Q6. Show the country with maximum medals won gold, silver, bronze */

select Team, count(Medal) as Gold_Medal
from Athlete
where Medal = 'Gold' 
group by team
order by Gold_Medal desc limit 1;

select Team, count(Medal) as Silver_Medal
from Athlete
where Medal = 'Silver' 
group by team
order by Silver_Medal desc limit 1 ;

select Team, count(Medal) as Bronze_Medal
from Athlete
where Medal = 'Bronze' 
group by team
order by Bronze_Medal desc limit 1;


/* Q7. Show the top 10 countries with respect to gold medals */

select Team, count(Medal) as Gold_Medal
from Athlete
where Medal = 'Gold' 
group by team
order by Gold_Medal desc 
limit 10;

/*Q8. Show in which year did United States won most medals*/

select Team, Year, count(Medal) as Medal
from Athlete
where Team = 'United States' and Medal != 'NoMedal' 
group by year
order by Medal desc 
limit 1;

/*Q9. In which sports United States has most medals*/

select Team, Sport, count(Medal) as Medal
from Athlete
where Team = 'United States' and Medal != 'NoMedal' 
group by Sport
order by Medal desc 
limit 1;

/* Q10. Find top 3 players who have won most medals along with their sports and country.*/

select Name, Team, Sport, count(Medal) as Medal
from Athlete
where Medal != 'NoMedal'
group by Name, Team, Sport
order by medal desc
limit 3;

/* Q11. Find player with most gold medals in cycling along with his country. */

select Name, Team, Sport, count(Medal) as Medal
from Athlete
where Medal = 'Gold' and Sport = 'Cycling'
group by Name, Team, Sport
order by medal desc;

/*Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.*/

select Name, Team, Sport, Medal as Medal_Name, count(Medal) as Medal
from Athlete
where Sport = 'Basketball' and Medal != 'NoMedal'
group by Name, Team, Sport, Medal
order by medal desc;

/* Q13. Find out the count of different medals of the top basketball player. */

select Name, Sport, Medal as Medal_Name, count(Medal) as Medal
from Athlete
where Sport = 'Basketball' and Medal !='NoMedal'
group by Name, Sport, Medal
order by medal desc;

/* Q14. Find out medals won by male, female each year . Export this data and plot graph in excel.*/

select year, sex, count(Medal) as Medal
from Athlete
where Medal !='NoMedal' 
group by year, sex
order by year desc;
