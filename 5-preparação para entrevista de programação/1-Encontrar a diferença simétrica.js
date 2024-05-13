function sym(args) {
    args = Array.from(arguments);
    let result = [];
    let tm = 0;

    for (let d = 0; d < args.length; d++) {
        for (let i = 0; i < args[d].length; i++) {
            let element = args[d][i];
            let tamanho = args.length - 1;
            if (tm != 0) {
                let tamanho = tamanho + tm;
            }
            if (!args[tamanho].includes(element)) {
                result.push(element);
            };
        }
        tm -= 1;
    }   
    return result;
  }
  
console.log(sym([1, 2, 3], [5, 2, 1, 4]));