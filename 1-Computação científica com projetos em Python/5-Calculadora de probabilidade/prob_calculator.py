import copy
import random

class Hat:
    def __init__(self,**kwargs):
        self.dictContents  = {}
        for color, quantity in kwargs.items():
            self.dictContents[color] = quantity
        self.contents = list(self.dictContents.keys())

    def draw(self,num_balls_drawn):
        coresSelecionadas = []
        self.selecionado = {}
        for i in range(0,num_balls_drawn):
            bola_Retiradas = random.randint(0,len(self.dictContents))
            corSelecionada = self.contents[bola_Retiradas - 1]
            novoValor = (self.dictContents[corSelecionada]) - 1
            self.dictContents[corSelecionada] = novoValor
            coresSelecionadas.append(corSelecionada)
            if corSelecionada in self.selecionado:
                qtd = self.selecionado[corSelecionada]
                self.selecionado[corSelecionada] = qtd + 1
            else: 
                self.selecionado[corSelecionada] = 1
        return self.selecionado
    def __str__(self):
        return self.dictContents
    

def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    num_matches = 0
    for i in range(num_experiments):
        balls = hat.draw(num_balls_drawn)
        if set(balls) == set(expected_balls):
            num_matches += 1
    probability = num_experiments / num_matches
    
    return probability

if __name__ == '__main__':
    hat = Hat(black=6, red=4, green=3)
    probability = experiment(hat=hat,
                    expected_balls={"red":2,"green":1},
                    num_balls_drawn=5,
                    num_experiments=2000)