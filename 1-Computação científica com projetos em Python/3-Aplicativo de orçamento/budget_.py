from collections import OrderedDict
class Category:
    def __init__(self, category):
        self.category = category
        self.ledger = []
        self.deposito_inicial = 0
        self.retirada_deposito = 0

    def deposit(self,qtde,descricao=''): #deposito
        self.deposito_inicial += qtde
        self.ledger.append({"amount": qtde, "description":descricao})
        
    def withdraw(self,qtde,descricao=''): #sacar
        self.retirada_deposito += qtde
        if self.deposito_inicial > 0:
            self.ledger.append({"amount": qtde*-1, "description":descricao})
        return True
    
    def get_balance(self):
        tamanho = (len(self.category) + 26) - 23
        def restringir_str(txt, max_palavras=23):
            # tirando os espaços e contando a palavra
            palavras = len(str(txt).strip())
            #tirando os . e - dos numeros
            conv_txt = str(txt).replace('.','').replace('-','')
            #fazendo um teste logico para ver se é uma frase
            if palavras < max_palavras and not conv_txt.isnumeric():
                #determinando o tamanho da palavra
                qtde_esp = ' ' * (23 - palavras)
                #retornando a palavra com o tanho ja determinado
                return f'{txt}{qtde_esp}'
            else:
                #teste logico para ver se a variavel palavras é um inteiro
                if palavras < max_palavras:
                    #retornando txt alinhado a esquerda com 6 espaços
                    try:
                        txt = f'{int(txt):.2f}'
                    except:
                        pass
                    return f'{txt:>{tamanho}}'
                else:
                    return txt[:max_palavras]
        def linha_cat(cat):
            print('*' * 13,end = '')
            print(cat,end = '')
            print('*' * 13)
        
        linha_cat(self.category)
        
        for value in self.ledger:
            novo_dicionario = OrderedDict(reversed(list(value.items())))
            for num, valor in novo_dicionario.items():
                print(f'{restringir_str(valor)}', end = '')
            print()

        calc = self.deposito_inicial - self.retirada_deposito
        print(f'Total: ')
        return calc

    def transfer(self,qtde,categoria):
        if self.deposito_inicial >= qtde:
            categoria.deposit(qtde,descricao=f'Transfer to {self.category}')
            res = True
        else:
            
            res = False
        return res
    
    def check_funds(self,valor):
        return valor > self.deposito_inicial

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
    """food = Category("Food")
    food.deposit(900, "deposit")
    food.withdraw(45.67, "milk, cereal, eggs, bacon, bread")
    transfer_amount = 20
    food_balance_before = food.get_balance()
    entertainment_balance_before = entertainment.get_balance()
    good_transfer = food.transfer(transfer_amount, entertainment)
    food_balance_after = food.get_balance()
    entertainment_balance_after = entertainment.get_balance()
    actual = food.ledger[2]
    print(actual)"""

    """clothing = Category("Clothing")
    food.transfer(50, clothing)
    clothing.withdraw(25.55)
    clothing.withdraw(100)
    print(clothing.get_balance())

    auto = Category("Auto")
    auto.deposit(1000, "initial deposit")
    auto.withdraw(15)
    print(auto.get_balance())

    print(food)
    print(clothing)

    print(create_spend_chart([food,clothing,auto]))"""