function rot13(str) {
    const strLista = str.toLowerCase().split("");
    let cifraROT13 = { a: 'n', b: 'o', c: 'p', d: 'q', e: 'r', f: 's', g: 't', h: 'u', i: 'v', j: 'w', k: 'x', l: 'y', m: 'z' };
    let res = "";
    for (let i = 0; i < strLista.length; i++) {
        if (strLista[i] == " ") {
            res += ' '
        }
        for (let j in cifraROT13) {
            if (strLista[i] === cifraROT13[j]) {
                res += j
                break
            }
        }
        function Inverter(obj) {
            var retobj = {};
            for (var key in obj) {
                const newKey = obj[key]
                retobj[newKey] = key;
            }
            return retobj
        }

        cifraROT13 = Inverter(cifraROT13)

        for (let j in cifraROT13) {
            if (strLista[i] === cifraROT13[j]) {
                res += j
                break
            }
        }
        res += i
    }

    return res;
  }
  
  console.log(rot13("?"))

 