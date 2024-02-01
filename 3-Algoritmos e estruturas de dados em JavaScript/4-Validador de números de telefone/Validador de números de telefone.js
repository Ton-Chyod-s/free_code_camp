function telephoneCheck(str) {
    const strLista = str.replace(/-/g," ").split(" ");
    const verificador = /(\d{1,2})?[-.\s]?[\W]?(\d{3})[\W]?[-.\s]?(\d{3})[-.\s]?(\d{4})$/g;
    const res = verificador.test(str);
    const regStr = /757/g

    if (!str.match(regStr)) {
        if (res) {
            return true
        } 
    }
    return false
  }
  
  console.log(telephoneCheck("2(757)6227382"));