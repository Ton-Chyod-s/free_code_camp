def arithmetic_arranger(problems, resposta=False):
    numerador = []
    denominador = []
    traco = []
    resultado = []

    if len(problems) > 5:
        return "Error: Too many problems."

    for problem in problems:
        num1, operador, num2 = problem.split()

        if operador not in ['+', '-']:
            return "Error: Operator must be '+' or '-'."

        if not (num1.isdigit() and num2.isdigit()):
            return "Error: Numbers must only contain digits."

        if len(num1) > 4 or len(num2) > 4:
            return "Error: Numbers cannot be more than four digits."

        width = max(len(num1), len(num2)) + 2
        numerador.append(num1.rjust(width))
        denominador.append(operador + num2.rjust(width - 1))
        traco.append('-' * width)

        if resposta:
            if operador == '+':
                result = int(num1) + int(num2)
            else:
                result = int(num1) - int(num2)
            resultado.append(str(result).rjust(width))

    formatted_problems = [
        '    '.join(numerador),
        '    '.join(denominador),
        '    '.join(traco)
    ]
    
    if resposta:
        formatted_problems.append('    '.join(resultado))

    return '\n'.join(formatted_problems)

if __name__ == '__main__':
    print(arithmetic_arranger(["32 + 8", "1 - 3801", "9999 + 9999", "523 - 49"], True))
    print(arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49"]))