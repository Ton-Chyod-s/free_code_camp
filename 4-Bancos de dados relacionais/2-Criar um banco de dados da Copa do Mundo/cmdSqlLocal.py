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

print('INSERT INTO teams(name) VALUES')
for i in listaW:
    print(F"('{i}'),")