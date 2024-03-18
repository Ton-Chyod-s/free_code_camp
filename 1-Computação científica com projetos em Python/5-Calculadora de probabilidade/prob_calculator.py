import copy
import random

class Hat:
    def __init__(self,*args):
        print(*args)

def experiment(hat, expected_balls, num_balls_drawn, num_experiments):
    pass


if __name__ == '__main__':
    hat = Hat(black=6, red=4, green=3)
    probability = experiment(hat=hat,
                    expected_balls={"red":2,"green":1},
                    num_balls_drawn=5,
                    num_experiments=2000)