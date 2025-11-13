#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "DROP TABLE data;"

$PSQL "DROP TABLE games;"

$PSQL "DROP TABLE teams;"

$PSQL "CREATE TABLE data(year INT NOT NULL, round VARCHAR(15) NOT NULL, winner VARCHAR(15) NOT NULL, opponent VARCHAR(15) NOT NULL, winner_goals INT NOT NULL, opponent_goals INT NOT NULL);"

$PSQL "CREATE TABLE teams(team_id SERIAL NOT NULL PRIMARY KEY, name TEXT UNIQUE NOT NULL)"

$PSQL "CREATE TABLE games(game_id SERIAL PRIMARY KEY NOT NULL, year INT NOT NULL, round VARCHAR(40) NOT NULL, winner_id INT NOT NULL REFERENCES teams(team_id), opponent_id INT NOT NULL REFERENCES teams(team_id), winner_goals INT NOT NULL, opponent_goals INT NOT NULL);"

$PSQL "\copy data FROM 'games.csv' WITH (FORMAT CSV, HEADER true, DELIMITER ',');"

$PSQL "INSERT INTO teams(name) (SELECT winner FROM data UNION SELECT opponent FROM data);"

$PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) (SELECT data.year, data.round, data.winner_goals, data.opponent_goals, t1.team_id, t2.team_id FROM data LEFT JOIN teams as t1 ON data.winner = t1.name LEFT JOIN teams as t2 ON data.opponent = t2.name);"

