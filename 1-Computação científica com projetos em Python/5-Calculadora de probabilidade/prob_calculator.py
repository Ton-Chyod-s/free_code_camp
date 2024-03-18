import copy
import random

class Hat:
    def __init__(self,**kwargs):
        self.contents  = {}
        for color, quantity in kwargs.items():
            self.contents[color] = quantity

    def draw(self,arg):
        color = list(self.contents.keys())
        coresSelecionadas = []
        for i in range(0,len(self.contents)):
            bola_Retiradas = random.randint(0,arg)
            corSelecionada = color[bola_Retiradas - 1]
            novoValor = (self.contents[corSelecionada]) - 1
            self.contents[corSelecionada] = novoValor
            coresSelecionadas.append(corSelecionada)
        return coresSelecionadas
        

def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    hat = hat
  
if __name__ == '__main__':
    hat = Hat(black=6, red=4, green=3)
    print(hat.draw(3))

    probability = experiment(hat=hat,
                    expected_balls={"red":2,"green":1},
                    num_balls_drawn=5,
                    num_experiments=2000)