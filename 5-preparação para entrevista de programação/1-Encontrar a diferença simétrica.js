function sym(args) {
    args = Array.from(arguments);
    let result = [];
 
    for (let i = 0; i < args.length; i++) {
        let element = args[i][i];
        if (!args[1].includes(element)) {
            result.push(element);
        };
    }   
    return result;
  }
  

console.log(sym([1, 2, 3], [5, 2, 1, 4]));