from collections import OrderedDict
class Category:
    def __init__(self, category):
        self.category = category
        self.ledger = []
        self.deposito_inicial = 0
        self.retirada_deposito = 0
        self.deposito_retirada = 0

    def deposit(self,qtde,descricao=''): #deposito
        self.deposito_inicial += qtde
        self.deposito_retirada += qtde
        self.ledger.append({"amount": qtde, "description":descricao})

    def withdraw(self,qtde,descricao=''): #sacar
        self.retirada_deposito += qtde *-1
        if self.deposito_inicial > 0:
            self.deposito_retirada -= qtde 
            self.ledger.append({"amount": qtde *-1, "description":descricao})
            return True
        else:
            return False
        
    def get_balance(self):
        pass

    def transfer(self,qtde,categoria):
        self.deposito_retirada -= qtde
        self.ledger.append({"amount": qtde *-1, "description":f"Transfer to {categoria}"})

    def check_funds(self,valor):
        pass

def create_spend_chart(categories):
    pass


if __name__ == '__main__':
    food = Category("Food")
    food.deposit(1000, "deposit")
    food.withdraw(10.15, "groceries")
    food.withdraw(15.89, "restaurant and more food for dessert")
    clothing = Category("Clothing")
    food.transfer(50, clothing)
    print(food)

    """
    *************Food*************
    initial deposit        1000.00
    groceries               -10.15
    restaurant and more foo -15.89
    Transfer to Clothing    -50.00
    Total: 923.96
    """