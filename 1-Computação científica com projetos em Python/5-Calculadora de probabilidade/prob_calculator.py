import copy
import random

class Hat:
    def __init__(self,**kwargs):
        self.dictContents  = {}
        for color, quantity in kwargs.items():
            self.dictContents[color] = quantity
        self.contents = []
        for color, quantity in self.dictContents.items():
            self.contents.extend([color] * quantity)

    def draw(self,num_balls_drawn):
        coresSelecionadas = []
        self.selecionado = {}
        for i in range(0,min(num_balls_drawn, len(self.contents))):
            bola_Retiradas = random.randint(0,len(self.contents) - 1)
            corSelecionada = self.contents.pop(bola_Retiradas)
            coresSelecionadas.append(corSelecionada)
            if corSelecionada in self.selecionado:
                qtd = self.selecionado[corSelecionada]
                self.selecionado[corSelecionada] = qtd + 1
            else: 
                self.selecionado[corSelecionada] = 1
        return self.selecionado
    
    def __str__(self):
        return str(self.dictContents)
    
def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    num_matches = 0
    for i in range(num_experiments):
        copied_hat = copy.deepcopy(hat)
        balls = copied_hat.draw(num_balls_drawn)
        if set(balls.keys()) == set(expected_balls.keys()):
            match = True
            for color, count in expected_balls.items():
                if balls.get(color, 0) < count:
                    match = False
                    break
            if match:
                num_matches += 1
    probability = num_matches / num_experiments

    return probability


if __name__ == '__main__':
    hat = Hat(black=6, red=4, green=3)
    probability = experiment(hat=hat,
                    expected_balls={"red":2,"green":1},
                    num_balls_drawn=5,
                    num_experiments=2000)
    print(probability)