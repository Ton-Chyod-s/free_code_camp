from games import dados
listaW = []
for linha in dados:
    for i in linha:
        winner = linha[2]
        opponent = linha[3]
        if winner == 1 or opponent == 1:
            opponent = ''
        if winner != 'winner' and winner not in listaW:
            listaW.append(winner)
            break
        elif opponent != 'opponent' and opponent not in listaW:
            listaW.append(opponent)
            break
        break


print('''CREATE DATABASE worldcup;
USE worldcup;   
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
      
    FOREIGN KEY (opponent_id) REFERENCES teams(id),
    FOREIGN KEY (winner_id) REFERENCES teams(id)
);
INSERT INTO teams(name) VALUES''')
for i in listaW:
    print(F"('{i}'),")