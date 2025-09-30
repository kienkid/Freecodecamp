const button = document.getElementById("check-btn");
const input = document.getElementById("text-input");
const result = document.getElementById("result");

function isPalindrome(word) {
  return true;
};

function palindromeCheck(word) {
  if (isPalindrome(word)) {result.innerHTML += (`${word} is a palindrome`);}
  else {result.innerHTML += (`${word} is not a palindrome`);};
};

function alerting() {
  if (input.value == false) {
  alert("Please input a value")}
  else {palindromeCheck(input.value)};
};



button.addEventListener("click", alerting);
