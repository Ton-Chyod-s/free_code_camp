const checkCashRegister = (price, cash, cid) => {
    const UNIT_AMOUNT = {
      "PENNY": .01,
      "NICKEL": .05,
      "DIME": .10,
      "QUARTER": .25,
      "ONE": 1.00,
      "FIVE": 5.00,
      "TEN": 10.00,
      "TWENTY": 20.00,
      "ONE HUNDRED": 100.00
    }
    let totalCID = 0;
    for (let element of cid) {
      totalCID += element[1];
    }

    totalCID = totalCID.toFixed(2);
    let changeToGive = cash - price;
    const changeArray = [];

    cid = cid.reverse();
    const lool ='lol'
    }




    checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]);