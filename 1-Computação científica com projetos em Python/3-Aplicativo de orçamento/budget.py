from collections import OrderedDict
class Category:
    def __init__(self, category):
        self.category = category
        self.ledger = []
        self.deposito_inicial = 0
        self.retirada_deposito = 0
        self.deposito_retirada = 0
    
    #Um método deposit, que aceita um valor e uma descrição. Se nenhuma descrição for dada, o padrão deverá ser uma string vazia. O método deve acrescentar um objeto à lista ledger na forma de {"amount": amount, "description": description}.
    def deposit(self,qtde,descricao=''): 
        self.deposito_inicial += qtde
        self.deposito_retirada += qtde
        self.ledger.append({"amount": qtde, "description":descricao})

    #Um método check_funds que aceita um valor como um argumento. Ele retorna False se o valor for maior que o saldo da categoria do orçamento e, caso contrário, retorna True. Este método deve ser usado tanto pelo método withdraw como pelo método transfer.
    def check_funds(self,qtde):
        if qtde > self.deposito_retirada:
            return False
        else:
            return True
        
    #Um método withdraw, semelhante ao método deposit, mas a quantia passada deve ser armazenada no ledger como um número negativo. Se não houver fundos suficientes, nada deve ser adicionado ao ledger. Este método deve retornar True se a retirada acontecer e, caso contrário, False.
    def withdraw(self,qtde,descricao=''): #sacar
        self.retirada_deposito += qtde *-1
        if self.check_funds(qtde):
            if self.deposito_inicial > 0:
                self.deposito_retirada -= qtde 
                self.ledger.append({"amount": qtde *-1, "description":descricao})
                return True
        else:
            return False

    #Um método get_balance, que retorna o saldo atual da categoria de orçamento com base nos depósitos e retiradas que ocorreram
    def get_balance(self):
        return self.deposito_retirada
    
    #Um método transfer, que aceita um valor e outra categoria de orçamento como argumentos. 
    def transfer(self,qtde,categoria):
        if self.check_funds(qtde):
            #O método deverá adicionar uma retirada com o valor e a descrição "Transfer to [categoria de destino no orçamento]".
            self.deposito_retirada -= qtde
            self.ledger.append({"amount": qtde *-1, "description":f"Transfer to {categoria.category}"})
            #O método deve, então, adicionar um depósito à outra categoria do orçamento, com o valor e a descrição "Transfer from [categoria de origem no orçamento]". Se não houver fundos suficientes, nada deve ser adicionado ao ledger. Este método deve retornar True se a transferência acontecer e, caso contrário, False.
            if self.deposito_retirada > qtde:
                self.deposit(qtde,f'Transfer from {self.category}')
                return True
        else:
            return False

def create_spend_chart(categories):
    pass

if __name__ == '__main__':
    food = Category("Food")
    food.deposit(900, "deposit")
    food.withdraw(45.67, "milk, cereal, eggs, bacon, bread")
    print(food)

    """
    *************Food*************
    initial deposit        1000.00
    groceries               -10.15
    restaurant and more foo -15.89
    Transfer to Clothing    -50.00
    Total: 923.96
    """