-- PROGRESSION - 1

-- 1. **Create table city**
create table city
( 
 id NUMBER(11) primary key,
 name VARCHAR(50) not null
 );
-- 2. **Create table referee**
create table referee
( 
 id NUMBER(11) primary key,
 name VARCHAR(50) not null
 );
-- 3. **Create table innings**
create table innings
( 
 id NUMBER(11) primary key,
 innings_number NUMBER(11) not null
 );
-- 4. **Create table extra_type**
create table extra_type
( 
 id NUMBER(11) primary key,
 name VARCHAR(50) not null
 );
-- 5. **Create table skill**
create table skill
( 
 id NUMBER(11) primary key,
 name VARCHAR(50) not null
 );
-- 6. **Create table team**
create table team
( 
 id NUMBER(11) primary key,
 name VARCHAR(50) not null, 
 coach VARCHAR(50) not null,
 home_city NUMBER(11) not null,
 foreign key(home_city) references city(id),
 captain NUMBER(11) not null
 );
-- 7. **Create table player**
create table player
(
 id NUMBER(11) primary key,
 name VARCHAR(50) not null,
 country VARCHAR(50) not null,
 skill_id NUMBER(11) not null,
 foreign key(skill_id) references skill(id),
 team_id NUMBER(11) not null,
 foreign key(team_id) references team(id)
 );
-- 8. **Create table venue**
create table venue
(
 id NUMBER(11) primary key,
 stadium_name VARCHAR(50) not null,
 city_id NUMBER(11) not null,
 foreign key(city_id) references city(id),
 );
-- 9. **Create table event**
create table event
(
id NUMBER(11) primary key,
innings_id NUMBER(11) not null,
foreign key(innings_id) references innings(id),
event_no NUMBER(11) not null,
raider_id NUMBER(11) not null,
foreign key(raider_id) references player(id),
raid_points NUMBER(11) not null,
defending_points NUMBER(11) not null,
clock_in_seconds NUMBER(11) not null,
team_one_score NUMBER(11) not null,
team_two_score NUMBER(11) not null
);
-- 10. **Create table extra_event**
create table extra_event
(
id NUMBER(11) primary key,
event_id NUMBER(11) not null,
foreign key(event_id) references event(id),
extra_type_id NUMBER(11) not null,
foreign key(extra_type) references extra_type(id),
points NUMBER(11) not null,
scoring_team_id NUMBER(11) not null,
foreign key(team_id) references team(id)
);
-- 11. **Create table outcome**
create table outcome
(
id NUMBER(11) primary key,
status VARCHAR(11) not null,
winner_team_id NUMBER(11),
foreign key(winner_team_id) references team(id),
score NUMBER(11),
player_of_match NUMBER(11),
foreign key(player_of_match) references player(id),
);
-- 12. **Create table game**
create table game
(
id NUMBER(11) primary key,
game_date DATE not null,
team_id_1 NUMBER(11) not null,
foreign key(team_id_1) references team(id),
team_id_2 NUMBER(11) not null,
foreign key(team_id_2) references team(id),
venue_id NUMBER(11) not null,
foreign key(venue_id) references venue(id),
outcome_id NUMBER(11) not null,
foreign key(outcome_id) references outcome(id),
referee_id_1 NUMBER(11) not null,
foreign key(referee_id_1) references referee(id),
referee_id_2 NUMBER(11) not null,
foreign key(referee_id_2) references referee(id),
first_innings_id NUMBER(11) not null,
foreign key(first_innings_id) references innings(id),
second_innings_id NUMBER(11) not null,
foreign key(second_innings_id) references innings(id)
);
-- 13. **Drop table city**
DROP TABLE city cascade constraints;
-- 14. **Drop table innings**
DROP TABLE innings cascade constraints;
-- 15. **Drop table skill**
DROP TABLE skill cascade constraints;
-- 16. **Drop table extra_type**
DROP TABLE extra_type cascade constraints;