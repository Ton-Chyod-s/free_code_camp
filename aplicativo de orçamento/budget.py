class Category:
    def __init__(self, category):
        self.category = category
        self.ledger = []

    def deposit(self,qtde,descricao):
        self.ledger.append({"quantidade": qtde, "Descrição":descricao})
        lol = lol
    def withdraw(sef):
        pass
    
    def get_balance(self):
        pass
    
    def transfer(self):
        pass

def create_spend_chart(categories):
    pass

if __name__ == '__main__':
    food = Category("Food")
    food.deposit(1000, "initial deposit")