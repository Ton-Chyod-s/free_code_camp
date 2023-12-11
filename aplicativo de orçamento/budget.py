class Category:
    def __init__(self, category):
        self.category = category
        self.ledger = []

    def deposit(self,qtde,descricao): #deposito
        self.ledger.append({"quantidade": qtde, "Descrição":descricao})
        

    def withdraw(self,qtde,descricao): #sacar
        self.ledger.append({"quantidade": qtde, "Descrição":descricao})
    
    
    def get_balance(self):
        pass
    
    def transfer(self):
        pass

def create_spend_chart(categories):
    pass

if __name__ == '__main__':
    food = Category("Food")
    food.deposit(1000, "initial deposit")
    