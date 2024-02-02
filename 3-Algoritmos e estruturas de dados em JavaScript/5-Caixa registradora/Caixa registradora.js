function checkCashRegister(price, cash, cid) {
    let change = cash - price;
    if (change === 0) {
      return {status: "CLOSED", change}
    } else if (change > 0) {
      const unidadesEmMoedas = { "PENNY": .01, "NICKEL": .05, "DIME": .10, "QUARTER": .25, "ONE": 1, "FIVE": 5, "TEN": 10,"TWENTY": 20, "ONE HUNDRED": 100 }

      return {status: "OPEN", change}
    } else {
      return {status: "INSUFFICIENT_FUNDS", change: []}
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