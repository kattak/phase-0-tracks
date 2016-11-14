console.log("gamepage.js loaded");

//All document elements, cached jQuery lookups
//to access

var $term = $('#term');


//$term with $term
//first comment out all not used; see if it still works
var DOC = {
  //term: document.getElementById("term"),

//$($term).text("YEAGAD").show();

  //for the categories
  //categoryWrapper: document.getElementById("categoryWrapper"),
  leftCategory: document.getElementById("category1"),
  rightCategory: document.getElementById("category2"),

  //stores all doc cats
  cats: [],



  //the whole card
  //card: $("#wholeCard"),

  //jumbotron
  jumbotron: document.getElementById("myJumbotron"),

  //for the displayed card
  //$term: document.getElementById("term"),
  //term: $('.term'),

  definition: document.getElementById("definition"),

  //list
  list: document.getElementById("list")
}

   //store DOC cats in array
  DOC.cats = [DOC.leftCategory, DOC.rightCategory];

//common game counters and data
var GAME = {
  //counters
  speed: 1000,
  //show definition or not
  showDefinition: false,
  //cardIndex of term/instructions card
  cardIndex: 0,
  //defined when cardsArray is made
  //the currentCard of GAME.cards[cardIndex]
  CURRENTCARD: '',
  //cards stores array of cards as objects
  cards: [],
  //cats stores array of cat(egories) as objects
  categories: [],
  //shown cat(egories) -- which categories are currently being shown?
  currentCategories: [],
  mode: "play"
}

/*Core Game Objects*/
//Category object
function Category(name, color, i, idName) {
  this.idName = idName;
  this.name = name;
  this.color = color;
  this.index = i;
}

function makeCategories(arry) {
    arry.forEach(function(elem, index){

      GAME.categories[index] = new Category(elem.name, elem.color, index, elem.idName);
})
};

function makeCards(arry) {
    arry.forEach(function(elem, index){
        GAME.cards[index] = new Card(index, elem.term, elem.definition, elem.image);
    })
};

//Card object
//function Card(index, term, definition, image, category, opposingCat) {
function Card(index, term, definition, image) {
  this.index = index;
  this.definition = getDefinition(definition);
  //stores image url
  this.image = image;
  //stores category
  this.category = getCategory(this);
  //stores opposing category
  this.opposingCategory = GAME.categories[parseInt((this.category.index + 1) % (GAME.categories.length))];
  //this.opposingCategory = opposingCat;
  //TO DO: record correct/incorrect history of term
  this.history = [];
  //term as given by data
  //i.e. "apple"
  //i.e. "el margen"
  this.givenTerm = term;
  //term displayed on flashcard
  //i.e. "apple"
  //i.e. "margen"
  this.displayTerm = getDisplayTerm(this);
  //final version of term displayed in list after player chooses category
  //i.e. "apple (noun)"
  //i.e. "el margen"
  this.finalTerm = getFinalTerm(this);
}

//Called from set.js
//input idName of category, return categoryObject
function getCategoryObject(str) {

  var ans = GAME.categories.filter(function(elem,index){
    return GAME.categories[index].idName == str;});
  return ans[0];
}



//Init, called from gamepage.html
function init() {
  //simplest:
  //console.log('oh hai'+"*D4EL means different for each level");
  //show some stuff
  //$(DOC.$term).text("YEAGAD").show();
  //$(DOC.$term).text("YEAGAD").show();
  //store DOC cats in array
 // DOC.cats = [DOC.leftCategory, DOC.rightCategory];
  //set up category objects from data-given categories
  makeCategories(DATA.cats);
  //check if categories are ok
  //debugger;
  //set up card objects from data-given cards
  makeCards(DATA.cards);
  //show instructions
  showInstructions();
  //set first currentcard
  //GAME.CURRENTCARD = GAME.cards[GAME.cardIndex];
  //make list of items (terms) on right side
  makeList();
  //first turn
  //newTurn();
};
var instructions = [];

//Instruction Card Object
function instructionCard(headerText, helperText, leftCategory, rightCategory, leftFunc, rightFunc) {
  this.headerText = headerText;
  this.helperText = helperText;
  this.leftCategory = leftCategory;
  this.rightCategory = rightCategory;
  this.leftFunc = leftFunc;
  this.rightFunc = rightFunc;
}
//GAME.CURRENTCARD = GAME.cards[GAME.cardIndex]
//newTurn();
//Hardcoding instruction cards and pushing them to instructions queue
function makeInstructions() {
  //Instructions
  var iCard = new instructionCard("Play with arrow keys.", "Click right arrow ▶ to continue", '◀ Choose other set', 'Continue ▶', function() {
    window.location.href = 'file:///Users/katkat/Desktop/wordblox/intro.html';
  }, function() {
    GAME.cardIndex = 1;
    showNextInstruction()
  });
  instructions.push(iCard);
  //
  //Show answers
  var iCard2 = new instructionCard("Want to see answers?", "Choose ◀ yes or no ▶", '◀ Yes', 'No ▶', hi, hi2);
  instructions.push(iCard2);
}
var hi = function() {
  //hide header feedback
  $("#feedback").hide();
  //hide definition
  GAME.showDefinition = true;
  //set to first card
  GAME.cardIndex = 0;
  GAME.CURRENTCARD = GAME.cards[0];
  //switch modes
  GAME.mode = 'play';
  // show loading text
  $($term).text('Loading first card...').show();
  //hide header feedback
  $("#feedback").hide();
  //timeout so instructions don't interfere with first card
  setTimeout(newTurn, 500);
}
var hi2 = function() {
  //hide header feedback
  $("#feedback").hide();
  //hide definition
  $(DOC.definition).hide();
  //set to first card
  GAME.cardIndex = 0;
  GAME.CURRENTCARD = GAME.cards[0];
  //switch modes
  GAME.mode = 'play';
  //hide header feedback
  $("#feedback").hide();
  // show loading text
  $($term).text('Loading first card...').show();
  setTimeout(newTurn, 500);
}
//process instructionCard queue
function showNextInstruction() {
  //show new card's term
  $($term).text(instructions[GAME.cardIndex].headerText).show();
  //show new card's definition
  $(DOC.definition).text(instructions[GAME.cardIndex].helperText).show();
  //show categories
    DOC.cats.forEach(function(elem){elem.style.width = "50%";
    elem.style.opacity = "1.0";})

  //set text for left
  $(DOC.cats[0]).children().html(instructions[GAME.cardIndex].leftCategory);
  //set text for right
  $(DOC.cats[1]).children().html(instructions[GAME.cardIndex].rightCategory);
}

function showInstructions() {
  //set game mode to instructions (affects how key events are processed)
  GAME.mode = 'instructions';
  //make instructionCards
  makeInstructions();
  //set cardIndex to 0 (already set to 0, but just for readability)
  GAME.cardIndex = 0;
  //show first iCard
  showNextInstruction();
}

function makeList() {


//add key to top
  //loop through categories
GAME.categories.forEach(function(elem,i){
//add div to list
    var tmpdiv = document.createElement("div");
    DOC.list.appendChild(tmpdiv);

    //set div's class and id
    tmpdiv.className = "key";
    tmpdiv.id = "key" + i;

    //set color
    tmpdiv.style.background = elem.color;

    //add text in div
    var tmpp = document.createElement("p");
    tmpp.className = "itemp";
    tmpdiv.appendChild(tmpp);

    //set text's attributes
    tmpp.innerHTML = elem.name;
   // tmpdiv.style.opacity = 0.5;
    //debugger;
})

GAME.cards.forEach(function(elem,i){

  //add div to list
    var tmpdiv = document.createElement("div");
    DOC.list.appendChild(tmpdiv);

    //set div's class and id
    tmpdiv.className = "item";
    tmpdiv.id = "item" + i;

    //add text in div
    var tmpp = document.createElement("p");
    tmpp.className = "itemp";
    tmpdiv.appendChild(tmpp);

    //set text's attributes
    tmpp.innerHTML = GAME.cards[i].displayTerm;
    tmpdiv.style.opacity = 0.5;
})
}

function endLevel() {
  console.warn("end of level");
  GAME.mode = "end";
  //stop accepting keydowns
  //say end of level
  $term.innerHTML = "Congratulations!";
  DOC.definition.innerHTML = "You finished this level.";
  //hide categories
  $("#categoryWrapper").hide();
  //change jumbotron color
  DOC.jumbotron.style.background = "Black";
  setTimeout(explode, 1500);
};

function explode() {
  $("#list").toggle('explode');
  $("#myJumbotron").toggle('explode');
}

function newTurn() {
  //hide header feedback
  $("#feedback").hide();
  if (GAME.cardIndex >= GAME.cards.length) { //Change to 2 for testing.
    //end of level
    endLevel();
  } else {
    //make current list item full opacity
    var tmpdiv = document.getElementById("item" + GAME.cardIndex.toString());
    tmpdiv.style.opacity = 1.0;
    //reset jumbotron style to css defaults
    DOC.jumbotron.style.cssText = "";
    //show cats
    $("#categoryWrapper").show();
    //set curerntCard based on cardIndex
    GAME.CURRENTCARD = GAME.cards[GAME.cardIndex];
    //show new card's term
    $($term).text(GAME.CURRENTCARD.displayTerm).show();
    //set new card's definition
    $(DOC.definition).hide();
    $(DOC.definition).text(GAME.CURRENTCARD.definition);
    //show new card's definition
    if (GAME.showDefinition) {
      $(DOC.definition).show();
    }
    console.warn("correct cat is: " + GAME.CURRENTCARD.category.name);
    //show new categories
    newCategories();
  }
}

//Currently unused
//For testing
function setOC(num) {
  if (num == null) {
    console.warn("num is undef");
    debugger;
  }
  GAME.CURRENTCARD.opposingCategory = GAME.categories[parseInt(num)];
  if (GAME.CURRENTCARD.opposingCategory == null) {
    console.warn("OC is undef");
    debugger;
  }
}

function newCategories() {
  var otherCategory = GAME.CURRENTCARD.opposingCategory;
  //first category
  //give first category 50% chance to be the correct category or something else
  chance = Math.round(Math.random());
  if (chance == 1) {
    GAME.currentCategories.push(GAME.CURRENTCARD.category);
    GAME.currentCategories.push(otherCategory);
  } else {
    GAME.currentCategories.push(otherCategory);
    GAME.currentCategories.push(GAME.CURRENTCARD.category);
  }

  DOC.cats.forEach(function(elem, idx){
    elem.style.width = "50%";
    elem.style.opacity = "1.0";
    elem.style.background = GAME.currentCategories[idx].color;
});
}

//docCat is the doc object category chosen
//otherDocCat is the doc object category not chosen
//chosenCat is the category object chosen, corresponds with docCat
function checkCategory(docCat, otherDocCat, chosenCat) { //can add as parameter: "notChosenCat"
  console.log("in checkCategory");
  //debugger;
  if (chosenCat && GAME.CURRENTCARD.category.name == chosenCat.name) {
    //header feedback
    //$("#feedback").text("☺ Correct!").show();
    //show final term (i.e. "el margen" for Spanish)
    $($term).text(GAME.CURRENTCARD.finalTerm).show();
    //show feedback
    otherDocCat.style.opacity = "0.5";
    //card jumbotron changes color to category
    DOC.jumbotron.style.background = chosenCat.color;
    //font changes to white
    DOC.jumbotron.style.color = "White";
    //hide text shadow
    DOC.jumbotron.style.textShadow = "none";

    //change item[cardIndex] color on right list
    var tmpdiv = document.getElementById("item" + GAME.cardIndex.toString());
    tmpdiv.style.background = GAME.CURRENTCARD.category.color;
    //sets opacity on next term, increments cardIndex
    setTimeout(addList, 900);
    //clean up shownCats
    GAME.currentCategories = []; //should be moved to newCategories???
    setTimeout(newTurn, 1000);
    docCat.children[0].innerText = "✓";
  }
  //if wrong category chosen
  else {
    //show feedback
    //header feedback
    // $("#feedback").text("☹ Wrong!").show();
    // var txt = $(DOC.definition).text();
    // $(DOC.definition).text("Correct answer: "+txt).show();
    //incorrectly chosen cat lowers opacity
    docCat.style.opacity = "0.5";
    //incorrectly chosen cat shown as x
    docCat.children[0].innerText = "✘";
    console.log("wah, should have chosen " + GAME.CURRENTCARD.category.name);
  }
};

function addList() {
  //make current list item full opacity
  var tmpdiv = document.getElementById("item" + GAME.cardIndex.toString());
  tmpdiv.style.opacity = 1;
  //change list item name to final term (i.e. "el margen" for Spanish)
  //get p of div first
  tmpdiv.children[0].innerText = GAME.CURRENTCARD.finalTerm;
  //increment cardIndex; don't loop back to 0
  GAME.cardIndex += 1;
}

/*RESPONDING TO USER EVENTS */
//disable window scrolling
window.addEventListener("keydown", function(e) {
  // space and arrow keys
  if ([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1) {
    e.preventDefault();
  }
}, false);
//respond to key presses
document.onkeydown = checkKey;
//if arrow key pressed
function checkKey(e) {
  if (GAME.mode == "instructions") {
    e = e || window.event;
    // left arrow
    if (e.keyCode == '37') {
      //left category function;
      instructions[GAME.cardIndex].leftFunc();
    }
    //right arrow
    else if (e.keyCode == '39') {
      //right category function
      instructions[GAME.cardIndex].rightFunc();
    }
  }
  if (GAME.mode == "play") {
    e = e || window.event;
    // left arrow
    if (e.keyCode == '37') {
      checkCategory(DOC.leftCategory, DOC.rightCategory, GAME.currentCategories[0]);
    }
    //right arrow
    else if (e.keyCode == '39') {
      checkCategory(DOC.rightCategory, DOC.leftCategory, GAME.currentCategories[1]);
    }
  }
};