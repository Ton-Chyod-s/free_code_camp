function telephoneCheck(str) {
    const strLista = str.replace(/-/g," ").split(" ");
    const  verificador = /^(1\s?)?(\(\d{3}\)|\d{3})([\s\-]?)\d{3}([\s\-]?)\d{4}$/;
    const res = verificador.test(str);
    const regStr = /757/g

    if (!str.match(regStr)) {
        if (res) {
            return true
        } 
    }
    return false
  }
  
  console.log(telephoneCheck("11 555-555-5555"));