-- SQLBook: Code
-- Active: 
create database film

create SCHEMA s1

create table s1.actor (
    actor_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    actor_age INTEGER,
)

CREATE TABLE s1.manager (
    manager_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    manager_age INTEGER,
    email VARCHAR(100)
)

create table s1.agent (
    agent_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    agent_age INTEGER,
    email VARCHAR(100)
)

create table s1.movie (
    movie_id int PRIMARY key,
    name VARCHAR(50),
    rating DECIMAL(4, 2),
    release_year int,
    runtime Interval
)

create table s1.movie_actor (
    movie_id int,
    actor_id int,
    actor_salary int,
    PRIMARY key (movie_id, actor_id)
)


ALTER TABLE s1.actor ADD COLUMN agent_id INTEGER

ALTER TABLE s1.actor ADD COLUMN manager_id INTEGER



alter table s1.actor
add constraint fk_agent_id
foreign key (agent_id) 
references s1.agent (agent_id);

alter table s1.actor
add constraint fk_manager_id
foreign key (manager_id) 
references s1.manager (manager_id);

alter table s1.movie_actor
add constraint fk_movie_actor_movie_id
foreign key (movie_id) 
references s1.movie (movie_id)

alter table s1.movie_actor
add constraint fk_movie_actor_actor_id
foreign key (actor_id) 
references s1.actor (actor_id)

insert into s1.agent (agent_id, name, agent_age, email) values (1, 'Agent1', 34, 'agent1@gmail.com');
insert into s1.agent (agent_id, name, agent_age, email) values (2, 'Agent2', 42, 'agentTwo@gmail.com');

insert into s1.manager (manager_id, name, manager_age, email) values (1, 'Manager1', 32, 'manager1@gmail.com');
insert into s1.manager (manager_id, name, manager_age, email) values (2, 'Manager2', 50, 'managerTwo@gmail.com');
INSERT into s1.actor (actor_id, name, actor_age, agent_id, manager_id) VALUES (1, 'Timothee Chalamet', 29, 2, 1);
insert into s1.actor (actor_id, name, actor_age, agent_id, manager_id) VALUES (2, 'Zendaya', 28, 1, 2);
insert into s1.actor (actor_id, name, actor_age, agent_id, manager_id) VALUES (3, 'Armie Hammer', 39, 2, 2);

insert into s1.movie (movie_id, name, rating, release_year, runtime) values (1, 'Dune', 8.0, 2021, Interval '2 hours 35 minutes');
insert into s1.movie (movie_id, name, rating, release_year, runtime) values (2, 'Call Me By Your Name', 7.7, 2017, interval '2 hours 10 minutes');
insert into s1.movie (movie_id, name, rating, release_year, runtime) values (3, 'Dune 2', 8.4, 2024, Interval '2 hours 46 minutes');

-- Dune 1
insert into s1.movie_actor (movie_id, actor_id, actor_salary) values (1, 1, 300000);
insert into s1.movie_actor (movie_id, actor_id, actor_salary) values (1, 2, 3500000);
-- call me by your name
insert into s1.movie_actor (movie_id, actor_id, actor_salary) values (2, 1, 350000);
insert into s1.movie_actor (movie_id, actor_id, actor_salary) values (2, 3, 300000);
-- dune 2
insert into s1.movie_actor (movie_id, actor_id, actor_salary) values (3, 1, 350000);
insert into s1.movie_actor (movie_id, actor_id, actor_salary) values (3, 2, 450000);