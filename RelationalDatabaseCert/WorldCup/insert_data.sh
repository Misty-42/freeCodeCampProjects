#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games,teams;")

GET_TEAM_ID(){
  #get team_id
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME';")
  #if not found
  if [[ -z $TEAM_ID ]]
  then
    #insert team
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME');")
    if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into teams, $TEAM_NAME
    fi
    #get new team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME';")
  fi
}

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # skips header row
  if [[ $YEAR != year ]]
  then
    # get winning team id
    TEAM_NAME=$WINNER
    GET_TEAM_ID
    WINNER_ID=$TEAM_ID
    # get opponent team id
    TEAM_NAME=$OPPONENT
    GET_TEAM_ID
    OPPONENT_ID=$TEAM_ID
    # insert game info and confirm successful
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS);")
    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into games, $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
    fi
  fi
done
