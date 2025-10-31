const checkButton = document.getElementById("check-btn");
const clearButton = document.getElementById("clear-btn");
const inputNumber = document.getElementById("user-input");
const output = document.getElementById("results-div");

function check() {
  if (inputNumber.value == "") {
    alert("Please provide a phone number");
  } else {
    validation(inputNumber.value);
  }
};

function clear() {
  output.innerText = ""
};

function validation(value) {
  if (isValidPhoneNumber(value)) {
    output.innerText = `Valid US number: ${value}`;
  } else {
    output.innerText = `Invalid US number: ${value}`
  }
};

function isValidPhoneNumber(phoneNumber) {
  const regex = /^(?:1[\s.-]?)?(?:\([0-9]{3}\)|[0-9]{3})[\s.-]?[0-9]{3}[\s.-]?[0-9]{4}$/;
  return regex.test(phoneNumber);
}
// /^ : start of the string
// (?:1[\s.-]?)? : optional with prefix 1 + [space, dot, hyphen]
// (?:\([0-9]{3}\)|[0-9]{3}) :exactly 3 digits inside parentheses or (|) no parentheses
// [\s.-]? : optional [space, dot, hyphen]
// [0-9]{3} exactly 3 digit number
// [\s.-]? : optional [space, dot, hyphen]
// [0-9]{4} exactly 4 digit number
// $/ : end of the string

checkButton.addEventListener("click",check);
clearButton.addEventListener("click",clear);
