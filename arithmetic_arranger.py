def arithmetic_arranger(problems, resposta=False):
  res = []
  qtde = len(problems)
  contas = []
  for linha in problems:
    valor1 = linha.split()
    for i in range(3):
      valor2 = valor1[i]
      res.append(valor2)

  for lin in range(qtde):
    indice = lin * 3
    linha1 = res[indice]
    linha2 = res[indice + 1] +' '+ res[indice + 2]
    valo1 = int(res[indice])
    valo3 = int(res[indice + 2])

    operadores = {
      '+': lambda x, y: x + y,
      '-': lambda x, y: x - y,
      '*': lambda x, y: x * y,
      '/': lambda x, y: x / y
    }

    if resposta:
      if res[indice + 1] in operadores:
          resposta = operadores[res[indice + 1]](valo1, valo3)
    else:
      resposta = ''

    print(f'{linha1}\n{linha2}\n-----\n{resposta}')
    
    
if __name__ == '__main__':
  arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49"])
  arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49"],True)