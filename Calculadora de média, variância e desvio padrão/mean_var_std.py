import numpy as np

def calculate(data):
    calculations = {}
    variacao_arredondar = {}
    variacao_modulo = {}
    media_modulo = {}

    try:
        data_matriz = np.matrix(data).reshape(3, 3)
        for i, modulo in enumerate(data_matriz):
            #variação  
            variance_total = np.var(data_matriz)
            variance_modulo = np.var(modulo)
            variance_modulo_list = str(variance_modulo).split(".")
            if int(variance_modulo_list[0]) > 0:
                variance_modulo_primeiro_elemento = int(variance_modulo)
            else:
                variance_modulo_primeiro_elemento = int(str(variance_modulo_list[1])[0])
            variacao_arredondar[f'valor {i}'] = variance_modulo_primeiro_elemento
            variacao_modulo[f'valor {i}'] = variance_modulo
            #media
            media_total = np.mean(data_matriz)
            media = np.mean(modulo)
            media_modulo[f'valor {i}'] = media
        modulo2 = data_matriz[1]
        modulo2 = modulo2.tolist()
        
        #variação
        lista_variaçao = list(variacao_arredondar.values())
        lista_variacao = f'[{lista_variaçao}, {list(variacao_modulo.values())}, {variance_total}]'
        #media
        lista_media = f'[{modulo2[0]}, {list(media_modulo.values())}, {media_total}]'

        calculations['mean'] = lista_media
        calculations['variance'] = lista_variacao
        calculations['standard deviation'] = 0
        calculations['max'] = 0
        calculations['min'] = 0
        calculations['sum'] = 0
        print(calculations)

    

        
      
    except ValueError as e:
        print(e)
        print("List must contain nine numbers.")

    return #calculations


if __name__ == '__main__':
    calculate([0,1,2,3,4,5,6,7,8])

    '''
    Por exemplo, calculate([0,1,2,3,4,5,6,7,8]) deve retornar:

    {
  'mean': [[3.0, 4.0, 5.0], [1.0, 4.0, 7.0], 4.0],
  'variance': [[6.0, 6.0, 6.0], [0.6666666666666666, 0.6666666666666666, 0.6666666666666666], 6.666666666666667],
  'standard deviation': [[2.449489742783178, 2.449489742783178, 2.449489742783178], [0.816496580927726, 0.816496580927726, 0.816496580927726], 2.581988897471611],
  'max': [[6, 7, 8], [2, 5, 8], 8],
  'min': [[0, 1, 2], [0, 3, 6], 0],
  'sum': [[9, 12, 15], [3, 12, 21], 36]
    }

    
    '''