let price = 10;
let cid = [
  ['PENNY', 1],
  ['NICKEL', 2.05],
  ['DIME', 3.1],
  ['QUARTER', 4.25],
  ['ONE', 90],
  ['FIVE', 55],
  ['TEN', 20],
  ['TWENTY', 60],
  ['ONE HUNDRED', 100],
];
const amount = [0.01, 0.05, 0.1, 0.25, 1, 5, 10, 20, 100];

function sum(cid) {
  let total = 0;
  for (const coin of cid) {
    total += coin[1]
  }
  const roundTotal = Math.round(total * 100) / 100;
  return roundTotal
}


const inputCash = document.getElementById("cash");
const buyBtn = document.getElementById("purchase-btn");
const output = document.getElementById("change-due");


function payChange() {
  if  (inputCash.value < price) {
    alert("Customer does not have enough money to purchase the item")
  } else if (inputCash.value > price) {
    changeCalc(inputCash.value)
  } else if (inputCash.value == price) {
    output.textContent = "No change due - customer paid with exact cash"
  } else {alert("Please put a number")}
  console.log((inputCash.value - price) - sum(cid), sum(cid));
}

function changeCalc(cash) {
  let change = cash - price
  if (change > sum(cid)) {
    output.textContent = "Status: INSUFFICIENT_FUNDS"
  } else if (Math.round((change - sum(cid))*100)/100 == 0) {
    const bill = []
    for (const coin of cid) {
      if (coin[1] == 0) {}
      else {
        bill.unshift(`${coin[0]}: \$${coin[1]}`)
    }}
    const billWord = bill.join(" ")
    output.textContent = `Status: CLOSED ${billWord}`
    
  } else if (change < sum(cid)) {
      const bill = []
      for (let i = 1; i <= cid.length; i++) {
        if (change > amount[amount.length - i]){
          if (change >= cid[cid.length - i][1]) {
            bill.push(`${cid[cid.length - i][0]}: \$${cid[cid.length - i][1]}`);
            change = change - cid[cid.length - i][1];
            console.log(change)
          } else {
            bill.push(`${cid[cid.length - i][0]}: \$${change - (change % amount[amount.length - i])}`)
          change = Math.round(((change + 0.00000001) % amount[amount.length - i])*100)/100 /* need to adjust plus 0.00000001 for rounding purpose => if not will be wrong (eg: 0.499999999 % 0.01 = 0.000000001 and when round will be 0.01*/
          console.log(change)
          }
        }
      }
      if (change > 0) {
        output.textContent = "Status: INSUFFICIENT_FUNDS"
      } else {
      const billWord = bill.join(" ")
      output.textContent = `Status: OPEN ${billWord}`}
  }
}

buyBtn.addEventListener("click", payChange)
