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



//Driver Code

//Longest Word function returns longest element of an array
console.log(longest_word(["long phrase","longest phrase","longer phrase"]))
//=> should return "longest phrase"

//One Match function returns true/false if there's at least one key value pair match
console.log(one_match({name: "Steven", age: 54}, {name: "Tamir", age: 54}))
//=> should return true

console.log(one_match({name: "Steven", age: 54}, {name: "Tamir", age: 53}))
//=> should return false