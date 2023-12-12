class Category:
    def __init__(self, category):
        self.category = category
        self.ledger = []
        self.deposito_inicial = 0
        self.retirada_deposito = 0

    def deposit(self,qtde,descricao): #deposito
        self.deposito_inicial += qtde 
        self.ledger.append({"Descrição":descricao, "quantidade": float(qtde)})
        

    def withdraw(self,qtde,descricao): #sacar
        self.retirada_deposito += qtde
        self.ledger.append({"Descrição":descricao, "quantidade": float(qtde*-1)})
    
    
    def get_balance(self):
        def restringir_str(txt, max_palavras=23):
            palavras = len(txt.strip())
            if palavras < max_palavras:
                return txt
            else:
                return ''.join(txt[:max_palavras])
        def linha(tamanho = 13):
            print('*' * tamanho,end = '')
        linha()
        print(self.category,end = '')
        linha()
        print()
        for value in self.ledger:
            for num, valor in value.items():  
                try:
                    print(f'{restringir_str(valor):<23}',end = ' ')
                except:
                    print(f'{valor:<23}',end = ' ') 
            print()
        calc = self.deposito_inicial - self.retirada_deposito
        print(f'Total: {calc}')
        return ''

    def transfer(self):
        pass

def create_spend_chart(categories):
    pass

if __name__ == '__main__':
    food = Category("Food")
    food.deposit(1000, "initial deposit")
    food.withdraw(10.15, "groceries")
    food.withdraw(15.89, "restaurant and more food for dessert")
    food.withdraw(50,'Transfer to Clothing')
    print(food.get_balance())

    """clothing = Category("Clothing")
    food.transfer(50, clothing)
    clothing.withdraw(25.55)
    clothing.withdraw(100)"""
    
    auto = Category("Auto")
    auto.deposit(1000, "initial deposit")
    #auto.withdraw(15)

    #print(food)
    #print(clothing)

    #print(create_spend_chart([food, clothing, auto]))