function convertToRoman(num) {
    const roman = {
        m: 1000,
        cm: 900,
        d: 500,
        cd: 400,
        c: 100,
        xc: 90,
        l: 50,
        xl: 40,
        x: 10,
        ix: 9,
        v: 5,
        iv: 4,
        i: 1
    }

    for (let i in roman){
        if (num === roman[i]) {
            console.log(roman[i])
        }
        
    }
    
    return num;
   }
   
   convertToRoman(1); // IXLVI

   