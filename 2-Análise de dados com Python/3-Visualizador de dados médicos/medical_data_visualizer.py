import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# 1
df = pd.read_csv('2-Análise de dados com Python\\3-Visualizador de dados médicos\\medical_examination.csv')

#2
df['overweight'] = (df['weight'] / ((df['height'] / 100) ** 2) > 25).astype(int)

#3
df['cholesterol'] = df['cholesterol'].map({1: 0, 2: 1, 3: 1})
df['gluc'] = df['gluc'].map({1: 0, 2: 1, 3: 1})

# 4
def draw_cat_plot():
    # 5
    
    variables = ['cholesterol', 'gluc', 'smoker', 'alco', 'active', 'overweight']

    # Create a FacetGrid with multiple plots
    grafico = sns.catplot(data=df, kind='count', x='cardio', hue='overweight')
        
    grafico.set_ylabels('')
    grafico.set_xlabels('')



    df_cat = None

    # 6
    df_cat = None
    

    # 7

    # 8
    fig = None


    # 9
    grafico.savefig('2-Análise de dados com Python\\3-Visualizador de dados médicos\\catplot.png')
   

    return grafico


# 10
def draw_heat_map():
    # 11
    df_heat = None

    # 12
    corr = None

    # 13
    mask = None



    # 14
    fig, ax = None

    # 15



    # 16
    fig.savefig('heatmap.png')
    return fig

if __name__ == "__main__":
    # 17
    draw_cat_plot()
    #draw_heat_map()