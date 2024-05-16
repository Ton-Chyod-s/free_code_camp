from games import dados
listaW = []
for linha in dados:
    for i in linha:
        winner = linha[2]
        opponent = linha[3]
        if winner != 'winner' and winner not in listaW:
            listaW.append(winner)
            break
        elif opponent != 'opponent' and opponent not in listaW:
            listaW.append(opponent)
            break
        break

print('''CREATE DATABASE worldcup;
  
CREATE TABLE teams(
    team_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE
);
      
CREATE TABLE games(
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
      
    FOREIGN KEY (opponent_id) REFERENCES teams(team_id),
    FOREIGN KEY (winner_id) REFERENCES teams(team_id)
);
\nINSERT INTO teams(name) VALUES''')

timesDict = {}
gamesList = []

for key, value in enumerate(listaW):
    if key == len(listaW) - 1:
        timesDict[key + 1] = value
        print(F"('{value}');")
    else:
        timesDict[key + 1] = value
        print(F"('{value}'),")

print(F"\nINSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES")

for linha in dados[1:]:  # Ignora o cabeçalho
    winner = linha[2]
    opponent = linha[3]
    numWinner = 0
    numOpponent = 0
    for key, value in timesDict.items():
        if winner == value:
            numWinner = key
            break
    for key, value in timesDict.items():
        if opponent == value:
            numOpponent = key
            break
    
    if numWinner is not None and numOpponent is not None:
        gamesList.append((linha[0], linha[1], numWinner, numOpponent, linha[4], linha[-1]))

print(gamesList)

for key, value in enumerate(gamesList):
    if key == len(gamesList) - 1:
        print(f'{value};')
    else:
        print(f'{value},')

lol = 'lol'