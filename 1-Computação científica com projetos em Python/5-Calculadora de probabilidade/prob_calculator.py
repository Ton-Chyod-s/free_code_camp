import copy
import random

class Hat:
    def __init__(self,**kwargs):
        self.dictContents  = {}
        for color, quantity in kwargs.items():
            self.dictContents[color] = quantity
        self.contents = list(self.dictContents.keys())

    def draw(self,arg):
        coresSelecionadas = []
        bolasSelecionadas = {}
        for i in range(0,arg):
            bola_Retiradas = random.randint(0,len(self.dictContents))
            corSelecionada = self.contents[bola_Retiradas - 1]
            novoValor = (self.dictContents[corSelecionada]) - 1
            self.dictContents[corSelecionada] = novoValor
            coresSelecionadas.append(corSelecionada)
            bolasSelecionadas[corSelecionada] =  1
        return coresSelecionadas
        
    def __str__(self):
        return self.dictContents
    

def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    if hat == expected_balls:
        pass
    else:
        pass

if __name__ == '__main__':
    hat = Hat(black=6, red=4, green=3)
    print(hat.draw(5))

    probability = experiment(hat=hat,
                    expected_balls={"red":2,"green":1},
                    num_balls_drawn=5,
                    num_experiments=2000)