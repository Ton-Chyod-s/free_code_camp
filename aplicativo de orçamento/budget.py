class Category:
    def __init__(self, category):
        self.category = category
        self.ledger = []
        self.deposito_inicial = 0
        self.retirada_deposito = 0

    def deposit(self,qtde,descricao): #deposito
        self.deposito_inicial += qtde
        self.ledger.append({"Descrição":descricao, "quantidade": f"{qtde:.2f}"})
        

    def withdraw(self,qtde,descricao='Apenas retirada'): #sacar
        self.retirada_deposito += qtde
        self.ledger.append({"Descrição":descricao, "quantidade": f"{qtde*-1:.2f}"})
    
    
    def get_balance(self):
        def restringir_str(txt, max_palavras=23):
            palavras = len(txt.strip())
            conv_txt = txt.replace('.','').replace('-','')
            if palavras > max_palavras and not conv_txt.isnumeric():
                qtde_esp = ' ' * (22 - palavras)
                return f'{txt}{qtde_esp}'
            else:
                if palavras < max_palavras:
                    return f'{txt}'
                else:
                    return ''.join(txt[:max_palavras])
                    
        def linha_cat(cat):
            print('*' * 13,end = '')
            print(cat,end = '')
            print('*' * 13)
        linha_cat(self.category)
        for value in self.ledger:
            for num, valor in value.items():  
                print(f'{restringir_str(valor):>8}', end = '')
                
            print()
        calc = self.deposito_inicial - self.retirada_deposito
        print(f'Total: {calc:.2f}')
        return ''

    def transfer(self,qtde,categoria):
        if self.deposito_inicial >= qtde:
            categoria.deposit(qtde,descricao=f'Transfer to {self.category}')

def create_spend_chart(categories):
    lista_numeral = []
    percentual_cat = {}
    print('Percentage spent by category')
    for i in categories:
        dicionario_da_classe = vars(i)
        categoria = dicionario_da_classe["category"]
        percentual_cat[categoria] = float(f'{dicionario_da_classe["retirada_deposito"]:.2f}') / 100
    
    for i in range(0,110,10):
        lista_numeral.append(i)
    lista_numeral.reverse()
    for i in lista_numeral:
        print(f'{i:>3}|')
    print(f'{"-" * 10:>14}')
    return ''
    
if __name__ == '__main__':
    food = Category("Food")
    food.deposit(1000, "initial deposit")
    food.withdraw(10.15, "groceries")
    food.withdraw(15.89, "restaurant and more food for dessert")
    food.withdraw(50,'Transfer to Clothing')
    print(food.get_balance())

    clothing = Category("Clothing")
    food.transfer(50, clothing)
    clothing.withdraw(25.55)
    clothing.withdraw(100)
    #print(clothing.get_balance())

    auto = Category("Auto")
    auto.deposit(1000, "initial deposit")
    auto.withdraw(15)
    print(auto.get_balance())

    #print(food)
    #print(clothing)

    #print(create_spend_chart([food,clothing,auto]))