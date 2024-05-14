function sym(args) {
    args = Array.from(arguments);
    let result = [];
    
    for (let d = 0; d < args.length; d++) {
        let tamanho = d + 1;
        if (tamanho == args.length) {
            break;
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
  
console.log(sym([1, 2, 3], [5, 2, 1, 4]));