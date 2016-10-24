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

//Driver Code
console.log(longest_word(["long phrase","longest phrase","longer phrase"]))
//should return "longest phrase"