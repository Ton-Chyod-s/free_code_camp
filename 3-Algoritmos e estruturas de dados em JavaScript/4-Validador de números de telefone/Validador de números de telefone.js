function telephoneCheck(str) {
    const verificador = /(\-|\s)?(\d{3})(\-|\s)?(\d{3})(\W)?(\d{4})/g
    // ^(\d{1,2})[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$
    
    const res = verificador.test(str)
    if (res) {
        return true
    } else {    
        return false
    }
  }
  
  console.log(telephoneCheck("1 555-555-5555"));