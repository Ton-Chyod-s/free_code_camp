function checkCashRegister(price, cash, cid) {
    let change = new Array();
    let calculo = cash - price;
    let valorTotalCid = 0;
    let count = 0;
    for (let i in cid) {
      if (count >= 3 && calculo > valorTotalCid) {
        break
      } else {
        valorTotalCid += cid[i][1];
      }
      count++;
    }
    if (calculo > valorTotalCid) {
      return {status: "INSUFFICIENT_FUNDS", change}
    } else if (calculo === 0 || calculo === valorTotalCid) {
      change = [...cid]
      return {status: "CLOSED", change}
    } else {
      const valorUnidadeDeMoeda = { "Penny": .01, "Nickel": .05, "Dime": .1, "Quarter": .25, "Dollar": 1, "Five Dollars": 5, "Ten Dollars": 10, "Twenty Dollars": 20, "One-hundred Dollars": 100 }
      
      for (let i in cid) {
        const valorAtual = cid[i][1]
        if (calculo > valorAtual) {
          console.log("lol")
        } 
      }
      

      return {status: "OPEN", change}
    }

  }
  
  console.log(checkCashRegister(19.5, 20, [["PENNY", 0.5], ["NICKEL", 0], ["DIME", 0], ["QUARTER", 0], ["ONE", 0], ["FIVE", 0], ["TEN", 0], ["TWENTY", 0], ["ONE HUNDRED", 0]]));