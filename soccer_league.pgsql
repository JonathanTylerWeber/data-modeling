DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    results TEXT NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    location TEXT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    season_id INTEGER REFERENCES season,
    head_referee_id INTEGER REFERENCES referees,
    assistant_referee_1_id INTEGER REFERENCES referees,
    assistant_referee_2_id INTEGER REFERENCES referees,
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
);

CREATE TABLE lineups
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    team_id INTEGER REFERENCES teams,
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams,
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
);