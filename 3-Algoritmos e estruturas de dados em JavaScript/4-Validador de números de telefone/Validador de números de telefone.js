function telephoneCheck(str) {
    const verificador = /\d{3}\-\d{3}\-\d{4}/g
    const res = str.match(verificador)
    if (res) {
        return true
    } else {    
        return false
    }
  }
  
  telephoneCheck("525-555-5555");