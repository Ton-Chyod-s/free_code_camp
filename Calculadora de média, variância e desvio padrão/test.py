import numpy as np

# Crie uma matriz NumPy com os dados
dados_matriz = np.array([[0, 3, 6], [1, 4, 7], [2, 5, 8]])

# Calcule o desvio padrão para cada linha (axis=1)
desvio_padrao_por_linha = np.std(dados_matriz, axis=1)

# Calcule o desvio padrão total (axis=None)
desvio_padrao_total = np.std(dados_matriz)

print("Desvio Padrão por Linha:", desvio_padrao_por_linha)
print("Desvio Padrão Total:", desvio_padrao_total)