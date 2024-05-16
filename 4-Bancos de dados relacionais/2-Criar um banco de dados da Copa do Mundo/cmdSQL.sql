select * from teams 
inner join games 
on teams.team_id = games.winner_id;

1 -
SELECT SUM(winner_goals) FROM games;

2 -
SELECT SUM(winner_goals + opponent_goals) FROM games;

3 -
select avg(winner_goals) from teams 
full join games 
on teams.team_id = games.winner_id;

4 -
select avg(winner_goals) from teams 
inner join games 
on teams.team_id = games.winner_id;

5 -
select round(avg(winner_goals), 2) from teams 
full join games 
on teams.team_id = games.winner_id 

6 -
SELECT AVG(total_goals) AS average_goals
FROM (
    SELECT winner_goals + opponent_goals AS total_goals
    FROM games
) AS total_goals;

7 -
select max(winner_goals) from games;

8 - 
select count(game_id) from games
where winner_goals > 2;

9 -
select name from teams 
inner join games 
on teams.team_id = games.winner_id
where year = 2018 and round = 'Final';

10 - 
select name from games
full join teams on 
( games.winner_id = teams.team_id or games.opponent_id = teams.team_id )
where year = 2014 and round = 'Eighth-Final'
order by name;

11 -
select distinct(name) from teams 
inner join games 
on teams.team_id = games.winner_id
where round = 'Eighth-Final'
order by name;

12 - 
select year, name from teams 
inner join games 
on teams.team_id = games.winner_id
where round = 'Final'
order by year;

13 -
select name from teams 
inner join games 
on teams.team_id = games.winner_id
where name like 'Co%';
