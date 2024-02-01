function telephoneCheck(str) {
    const strLista = str.replace(/-/g," ").split(" ");
    const verificador = /(\d{1,2})?[-.\s]?(\d{3})[-.\s]?(\d{3})[-.\s]?(\d{4})$/g;
    const res = verificador.test(str);
    if (res) {
        return true
    } else {  
        return false
    }
  }
  
  console.log(telephoneCheck("1 555-555-5555"));