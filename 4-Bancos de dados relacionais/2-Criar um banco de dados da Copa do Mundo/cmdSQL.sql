/* exemplo */
select * from teams 
inner join games 
on teams.team_id = games.winner_id;


SELECT SUM(winner_goals) FROM games;


SELECT SUM(winner_goals + opponent_goals) FROM games;


select avg(winner_goals) from teams 
full join games 
on teams.team_id = games.winner_id;


select avg(winner_goals) from teams 
inner join games 
on teams.team_id = games.winner_id;


select round(avg(winner_goals), 2) from teams 
full join games 
on teams.team_id = games.winner_id 


SELECT AVG(total_goals) AS average_goals
FROM (
    SELECT winner_goals + opponent_goals AS total_goals
    FROM games
) AS total_goals;


select max(winner_goals) from games;


select count(game_id) from games
where winner_goals > 2;


select name from teams 
inner join games 
on teams.team_id = games.winner_id
where year = 2018 and round = 'Final';

 
select name from games
full join teams on 
( games.winner_id = teams.team_id or games.opponent_id = teams.team_id )
where year = 2014 and round = 'Eighth-Final'
order by name;


select distinct(name) from teams 
inner join games 
on teams.team_id = games.winner_id
where round = 'Eighth-Final'
order by name;

 
select year, name from teams 
inner join games 
on teams.team_id = games.winner_id
where round = 'Final'
order by year;


select name from teams 
inner join games 
on teams.team_id = games.winner_id
where name like 'Co%';
