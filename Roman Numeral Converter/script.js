const button = document.getElementById("convert-btn");
const inputValue = document.getElementById("number");
const outputValue = document.getElementById("output")

function convert(value){
  const m = Math.floor(value/1000);
  const afterM = value % 1000;
  const c = Math.floor(afterM/100);
  const afterC = afterM % 100;
  const afterL = afterC % 50;
  const x = Math.floor(afterC/10);
  const afterX = afterL % 10;
  const arrayC = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"];
  const arrayL = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"];
  const arrayX = ["","I","II","III","IV","V","VI","VII","VIII","IX"];
  const result = "M".repeat(m) + arrayC[c] + arrayL[x] + arrayX[afterX];
  outputValue.innerText = result;
};


function alerting() {
  if (isNaN(inputValue.value) || inputValue.value == ""){
    outputValue.innerText = "Please enter a valid number"
  } 
  else if (inputValue.value < 0) {
   outputValue.innerText = "Please enter a number greater than or equal to 1"
  }
  else if (inputValue.value >= 4000) {
    outputValue.innerText = "Please enter a number less than or equal to 3999"
  }
  else {
    convert(inputValue.value);
  };
};

button.addEventListener("click",alerting);


const a = Math.floor(3989 / 1000);
console.log(a);
