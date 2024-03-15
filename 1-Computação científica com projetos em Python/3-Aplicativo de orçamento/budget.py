from collections import OrderedDict
class Category:
    def __init__(self, category):
        self.category = category
        self.ledger = []
        self.balance = 0
        self.withdraw_deposit = 0
    
    #Um método deposit, que aceita um valor e uma descrição. Se nenhuma descrição for dada, o padrão deverá ser uma string vazia. O método deve acrescentar um objeto à lista ledger na forma de {"amount": amount, "description": description}.
    def deposit(self,qtde,descricao=''): 
        self.balance += qtde
        self.ledger.append({"amount": qtde, "description":descricao})

    #Um método check_funds que aceita um valor como um argumento. Ele retorna False se o valor for maior que o saldo da categoria do orçamento e, caso contrário, retorna True. Este método deve ser usado tanto pelo método withdraw como pelo método transfer.
    def check_funds(self,qtde):
        if qtde > self.balance:
            return False
        else:
            return True
        
    #Um método withdraw, semelhante ao método deposit, mas a quantia passada deve ser armazenada no ledger como um número negativo. Se não houver fundos suficientes, nada deve ser adicionado ao ledger. Este método deve retornar True se a retirada acontecer e, caso contrário, False.
    def withdraw(self,qtde,descricao=''): 
        self.withdraw_deposit += qtde *-1
        if self.check_funds(qtde):
            if self.balance > 0:
                #atualizando deposito inicial
                self.ledger[0]['amount'] = self.ledger[0]['amount'] - qtde
                #adicionando dicionario na lista
                self.ledger.append({"amount": qtde *-1, "description":descricao})
                return True
        else:
            return False

    #Um método get_balance, que retorna o saldo atual da categoria de orçamento com base nos depósitos e retiradas que ocorreram
    def get_balance(self):
        balance = self.ledger[0]['amount']
        return balance
    
    #Um método transfer, que aceita um valor e outra categoria de orçamento como argumentos. 
    def transfer(self,qtde,category):
        if self.check_funds(qtde):
            #atualizando deposito inicial
            self.ledger[0]['amount'] = self.ledger[0]['amount'] - qtde

            #O método deverá adicionar uma retirada com o valor e a descrição "Transfer to [categoria de destino no orçamento]".
            self.ledger.append({"amount": qtde *-1, "description":f"Transfer to {category.category}"})
            #O método deve, então, adicionar um depósito à outra categoria do orçamento, com o valor e a descrição "Transfer from [categoria de origem no orçamento]". Se não houver fundos suficientes, nada deve ser adicionado ao ledger. Este método deve retornar True se a transferência acontecer e, caso contrário, False.
            if self.ledger[0]['amount'] > qtde:
                category.balance += qtde
                category.ledger.append({"amount":qtde, "description": f'Transfer from {self.category}'})
                return True
        else:
            return False

    def __str__(self):
        title = f"{'*' * ((30 - len(self.category)) // 2)}{self.category}{'*' * ((30 - len(self.category)) // 2)}\n"
        transactions = ''.join([f"{entry['description'][:23]:23}{entry['amount']:>7.2f}\n" for entry in self.ledger])
        total = f"Total: {self.ledger[0]['amount']:.2f}"
        return title + transactions + total
    
def create_spend_chart(categories):
    pass

if __name__ == '__main__':
    food = Category("Food")
    food.deposit(1000, "deposit")
    food.withdraw(10.15, "groceries")
    food.withdraw(15.89, "restaurant and more food for dessert")
    food.get_balance()
    clothing = Category("Clothing")
    food.transfer(50, clothing)
    print(food)
