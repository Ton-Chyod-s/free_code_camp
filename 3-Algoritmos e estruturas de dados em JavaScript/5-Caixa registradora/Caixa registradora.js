function checkCashRegister(price, cash, cid) {
  let change = [];
  let calculo = cash - price;
  let valorTotalCid = 0;

  for (let i = 0; i < cid.length; i++) {
    valorTotalCid += cid[i][1];
  }

  if (calculo > valorTotalCid) {
    return { status: "INSUFFICIENT_FUNDS", change };
  } else if (calculo === 0 || calculo === valorTotalCid) {
    change = [...cid];
    return { status: "CLOSED", change };
  } else {
    const valorUnidadeDeMoeda = { "PENNY": 0.01, "NICKEL": 0.05, "DIME": 0.1, "QUARTER": 0.25, "ONE": 1, "FIVE": 5, "TEN": 10, "TWENTY": 20, "ONE HUNDRED": 100 };

    for (let i = cid.length - 1; i >= 0; i--) {
      const nomeMoeda = cid[i][0];
      const valorAtual = cid[i][1];

      if (calculo >= valorUnidadeDeMoeda[nomeMoeda]) {
        let quantidadeUsada = 0;
        if (nomeMoeda === 'PENNY') {
          quantidadeUsada = Math.min(Math.floor(calculo / valorUnidadeDeMoeda[nomeMoeda]), valorAtual / valorUnidadeDeMoeda[nomeMoeda]) + 1;
        } else {
          quantidadeUsada = Math.min(Math.floor(calculo / valorUnidadeDeMoeda[nomeMoeda]), valorAtual / valorUnidadeDeMoeda[nomeMoeda])
        }
        const valorDeduzido = quantidadeUsada * valorUnidadeDeMoeda[nomeMoeda];
        change.push([nomeMoeda, valorDeduzido]);
        const calculoFixed = calculo.toFixed(2)
        if (calculoFixed == valorDeduzido) {
          calculo = 0
        } else {
          calculo -= valorDeduzido;
        }
        
      }
    }

    if (calculo === 0 || calculo.toFixed(2) == 0.01) {
      return { status: "OPEN", change };
    } else {
      return { status: "INSUFFICIENT_FUNDS", change: [] };
    }
  }
}

console.log(checkCashRegister(3.26, 100, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]));
