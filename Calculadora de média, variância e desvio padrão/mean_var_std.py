import numpy as np

def calculate(data):
    variacao_arredondar = {}
    variacao_modulo = {}
    media_modulo = {}
    desvio_padrao = {}
    max = {}
    min = {}
    soma = {}
    media_elementos_modulo = {}
    desvio_elementos_modulo = {}
    max_elementos_modulo = {}
    min_elementos_modulo = {}
    sum_elementos_modulo = {}
    matriz_primeiro_elemento = []
    matriz_segundo_elemento = []
    matriz_terceiro_elemento = []
    try:
        data_matriz = np.array(data).reshape(3, 3)
        for i, modulo in enumerate(data_matriz):
            lista_modulo = list(str(data_matriz[i]).replace('[','').replace(']','').replace(' ',''))
            for lis, num in enumerate(lista_modulo):
                matriz_primeiro_elemento.append(int(lista_modulo[lis]))
                matriz_segundo_elemento.append(int(lista_modulo[lis+1]))
                matriz_terceiro_elemento.append(int(lista_modulo[lis+2]))
                break
            #variação  
            variance_total = np.var(data_matriz)
            variance_modulo = np.var(modulo)
            variance_modulo_list = str(variance_modulo).split(".")
            if int(variance_modulo_list[0]) > 0:
                variance_modulo_primeiro_elemento = float(variance_modulo)
            else:
                variance_modulo_primeiro_elemento = float(str(variance_modulo_list[1])[0])
            variacao_arredondar[f'valor {i}'] = variance_modulo_primeiro_elemento
            variacao_modulo[f'valor {i}'] = variance_modulo
            #media
            media_total = np.mean(data_matriz)
            media = np.mean(modulo)
            media_modulo[f'valor {i}'] = media
            #desvio padrão
            desvio_padrao_total = np.std(data_matriz)
            desvio = np.std(modulo)
            desvio_padrao[f'valor {i}'] = desvio
            #max
            max_total = np.max(data_matriz)
            max_ = np.max(modulo)
            max[f'valor {i}'] = max_
            #min
            min_total = np.min(data_matriz)
            min_ = np.min(modulo)
            min[f'valor {i}'] = min_
            #sum
            sum_total = np.sum(data_matriz)
            sum_ = np.sum(modulo)
            soma[f'valor {i}'] = sum_
        for i, modulo in enumerate(data_matriz):
            def calculo(txt,txt1):
                txt[f'desvio_total_{i}'] = txt1(matriz_primeiro_elemento)
                txt[f'desvio_total_{i+1}'] = txt1(matriz_segundo_elemento)
                txt[f'desvio_total_{i+2}'] = txt1(matriz_terceiro_elemento)
            #media
            calculo(media_elementos_modulo,np.mean)
            #desvio padrão
            calculo(desvio_elementos_modulo,np.std)
            #max
            calculo(max_elementos_modulo,np.max)
            #min
            calculo(min_elementos_modulo,np.min)
            #sum
            calculo(sum_elementos_modulo,np.sum)
            break
        modulo2 = data_matriz[1]
        modulo2 = modulo2.tolist()
        #variação
        lista_variacao = [list(variacao_arredondar.values()), list(variacao_modulo.values()), {variance_total}]
        #media
        lista_media = [list(media_elementos_modulo.values()), list(media_elementos_modulo.values()), media_total]
        #desvio padrão 
        lista_desvio = [list(desvio_elementos_modulo.values()), list(desvio_padrao.values()), desvio_padrao_total]
        #max
        lista_max = [list(max_elementos_modulo.values()), list(max.values()), max_total]
        #min
        lista_min = [list(min_elementos_modulo.values()), list(min.values()),min_total]
        #sum
        lista_sum = [list(sum_elementos_modulo.values()), list(soma.values()),sum_total]

        calculations = {
            'mean': lista_media,
            'variance': lista_variacao,
            'standard deviation': lista_desvio,
            'max': lista_max,
            'min': lista_min,
            'sum': lista_sum
        }
    except ValueError as e:
        print("ValueError not raised by calculate.")
    return calculations

if __name__ == '__main__':
    print(calculate([2,6,2,8,4,0,1,5,7]))

    