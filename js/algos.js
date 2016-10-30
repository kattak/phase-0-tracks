//longest word or phrase in the array function:
//initialize result as an empty String
//iterate through given array, if length is longer than length of empty String(
//set result to be that word
//return result once entire array has been iterated through


function longest_word(ary){
  result = ""
  for (var i = 0; i < ary.length; i++){
    current_word = ary[i]
    if (current_word.length > result.length){
      result = current_word
    }
  }
  return result
}

//function returns true/false if the objects share at least one key-value pair
//get list of keys
//set "match" bool to false
//iterate through the keys of the objects, checking if key-value pairs match
//if at least one matches, set match to true
//return "match"

function one_match(obj1, obj2){
  match = false;

  keys = Object.keys(obj1);

  for (var i = 0; i < keys.length; i++){
    current_key = keys[i];
    val1 = obj1[current_key];
    val2 = obj2[current_key];
    if (val1 == val2){
      match = true;
    }
  }
  return match
}

//two functions - one for building an array of n length, one for building a word of n length

//generate_ary:
//function takes in n for length and returns n strings in array of length 1 to 10 letters
//until result_ary length == n, calls generate_word function

//generate_word:
//store alphabet in string, convert to array, generate a random number from 0 to 25 to be the index
//gives you a random letter from the array
//until length of result_str is length, keep adding a random letter from the array

function generate_ary(n){
var result_ary = []
var current_word

while (result_ary.length < n){
  current_word = generate_word(Math.floor(Math.random() * 10 + 1));
  result_ary.push(current_word);
}
return result_ary;
}

//generate word of random letters of length n
function generate_word(n){
  var alpha_array = "abcdefghijklmnopqrstuvxyz".split("")
  var rand_index = Math.floor(Math.random() * 26);
  var rand_letter = alpha_array[rand_index];

  var word = "";
  while (word.length < n){
    rand_index = Math.floor(Math.random() * 26);
    rand_letter = alpha_array[rand_index];
    word += rand_letter;
  }
  return word;
}

//Driver Code

//Longest Word function returns longest element of an array
console.log(longest_word(["long phrase","longest phrase","longer phrase"]));
//=> should return "longest phrase"

//One Match function returns true/false if there's at least one key value pair match
console.log(one_match({name: "Steven", age: 54}, {name: "Tamir", age: 54}));
//=> should return true

console.log(one_match({name: "Steven", age: 54}, {name: "Tamir", age: 53}));
//=> should return false

// Add driver code that does the following 10 times: generates an array, prints the array, feeds the array to your "longest word" function, and prints the result.
for (var i = 0; i < 10; i++){
  var test_ary = generate_ary(3);
  console.log(test_ary);
  console.log(longest_word(test_ary));
}