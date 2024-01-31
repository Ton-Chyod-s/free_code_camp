function palindrome(str) {
    let minuscula = str.toLowerCase()
    let semEspaço = minuscula.replace(/[^A-Za-z0-9]/g, '')
    console.log(semEspaço)
    const palindromo = new Array();

    for (let i = 0; i < semEspaço.length; i++) {
        palindromo.unshift(semEspaço[i]);
        
    }
    console.log(palindromo.join(''))

    if (semEspaço === palindromo.join('')) {
        return true;
    } else {
        return false;
    }
    
  }
  
  palindrome("race car")