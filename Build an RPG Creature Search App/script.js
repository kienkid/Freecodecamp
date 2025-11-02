const input = document.getElementById("search-input");
const searchBtn = document.getElementById("search-button");
const h1 = document.getElementById("h1");
const creatureName = document.getElementById("creature-name");
const creatureID = document.getElementById("creature-id");
const creatureWeight = document.getElementById("weight");
const creatureHeight = document.getElementById("height");
const creatureTypes = document.getElementById("types");
const creatureHP = document.getElementById("hp");
const creatureAttack = document.getElementById("attack");
const creatureDefense = document.getElementById("defense");
const creatureSpecialAttack = document.getElementById("special-attack");
const creatureSpecialDefendse = document.getElementById("special-defense");
const creatureSpeed = document.getElementById("speed");



let creaturesName = [];
let currentCreatureId = 0;

fetch("https://rpg-creature-api.freecodecamp.rocks/api/creatures")
  .then(response => response.json())
  .then((data) => {
    creaturesName = data;
  })
  .catch((err) => {
   h1.innerHTML += '<p class="error-msg">There was an error loading the creatures data</p>';
  });


function search() { 
  for (const creature of creaturesName){ 
    const {id, name} = creature; 
    if(input.value == id || input.value == name){
       currentCreatureId = id; 
       searchinfo(input.value); 
       return; 
       } 
    } 
  alert("Creature not found");
}

function searchinfo(creatureId) { 
  const web = "https://rpg-creature-api.freecodecamp.rocks/api/creature/" + creatureId; 
  fetch(web) 
    .then(response => response.json()) 
    .then((data) => { 
      const creaturesInfo = data; 
      showinfo(creaturesInfo);
      }) 
    .catch((err) => { 
      h1.innerHTML = '<p class="error-msg">There was an error loading the creature data</p>'; 
      }); 
}

function showinfo(creaturesInfo) {
  const {id, name, weight, height, types, stats} = creaturesInfo;
  const [hp, attack, defense, special_attack, special_defense, speed] = stats;
  creatureName.textContent = `${name}`;
  creatureID.textContent = `#${id}`;
  creatureWeight.textContent = `Weight: ${weight}`;
  creatureHeight.textContent = `Height: ${height}`;
  creatureHP.textContent = `${hp.base_stat}`;
  creatureAttack.textContent = `${attack.base_stat}`;
  creatureDefense.textContent = `${defense.base_stat}`;
  creatureSpecialAttack.textContent = `${special_attack.base_stat}`;
  creatureSpecialDefendse.textContent = `${special_defense.base_stat}`;
  creatureSpeed.textContent = `${speed.base_stat}`;
  creatureTypes.innerHTML = "";
  for (const type of types) {
    creatureTypes.innerHTML += `<li>${type.name.toUpperCase()}</li>`;
  }
}

searchBtn.addEventListener("click",search);
