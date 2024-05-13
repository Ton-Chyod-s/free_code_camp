function sym(args) {
    args = Array.from(arguments);
    let result = [];
    let tamanho = 0;

    for (let d = 0; d < args.length; d++) {
        if (tamanho != 0) {
            if (tamanho === 1) {
                tamanho = tamanho - 1;
            } else if (tamanho === 2) {
                tamanho = tamanho - 2;
            } else if (tamanho === 3) {
                tamanho = tamanho - 3;
            }
            
        } else {
            tamanho = args.length - 1;
        }
        for (let i = 0; i < args[d].length; i++) {
            let element = args[d][i];
            if (!args[tamanho].includes(element)) {
                if (!result.includes(element)) {
                    result.push(element);
                }
            };
        }
    }   
    return result;
  }
  
console.log(sym([1, 2, 5], [2, 3, 5], [3, 4, 5]));