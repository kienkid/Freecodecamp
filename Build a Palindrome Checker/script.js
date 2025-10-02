const button = document.getElementById("check-btn");
const input = document.getElementById("text-input");
const result = document.getElementById("result");

function clean(word) {
  const wordSensitive = word.toLowerCase();
  const wordClean = wordSensitive.replace(/[^a-z0-9]/g,"");
  return wordClean;
};

function isPalindrome(word) {
  const wordClean = clean(word);
  const wordArray = wordClean.split("");
  const wordLength = wordArray.length;
  let palindromeCheck = true;
  if (wordLength /*% 2 === 0*/){
    for (let i = 0; i < wordLength/2; i++) {
      palindromeCheck = wordArray[i] === wordArray[wordLength-1-i];
      if (palindromeCheck == false){
        return false
      };
    };
    return palindromeCheck;
  }
  else {return false;};
};

function palindromeCheck(word) {
  if (isPalindrome(word)) {result.innerHTML = (`${word} is a palindrome`);}
  else {result.innerHTML = (`${word} is not a palindrome`);};

};

function alerting() {
  if (input.value == false) {
  alert("Please input a value")}
  else {palindromeCheck(input.value)};
};



button.addEventListener("click", alerting);
