function checkCashRegister(price, cash, cid) {
    let change = new Array();
    const calc = cash - price;
    if (calc === 0) {
      return {status: "CLOSED", change}
    } else if (calc > 0) {
      const unidadesEmMoedas = [ "PENNY", .01, "NICKEL", .05, "DIME", .10, "QUARTER", .25, "ONE", 1, "FIVE", 5, "TEN", 10,"TWENTY", 20, "ONE HUNDRED", 100 ];
      for (let i = 0; i < unidadesEmMoedas.length; i += 2) {
        const elementoUnidadesEmMoedas = unidadesEmMoedas[i]
        const j = i
        let proximovalorUnidadesEmMoedas;
        proximovalorUnidadesEmMoedas = unidadesEmMoedas[j + 3]
        if (calc <= proximovalorUnidadesEmMoedas) {
          res = change.push([elementoUnidadesEmMoedas,calc])
          break
        }
      }
      return {status: "OPEN", change}
    } else {
      return {status: "INSUFFICIENT_FUNDS", change}
    }
  }
  
  console.log(checkCashRegister(19.5, 20, [
    ["PENNY", 1.01], 
    ["NICKEL", 2.05], 
    ["DIME", 3.1], 
    ["QUARTER", 4.25], 
    ["ONE", 90], 
    ["FIVE", 55], 
    ["TEN", 20], 
    ["TWENTY", 60], 
    ["ONE HUNDRED", 100]
  ]));