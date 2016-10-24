// reverse:
// initialize "result" an empty string to hold the result
// iterate through each letter/character of input String from the last character to the first
// add each character to the "result" string
// return the "result" string

function reverse(input){
  result = "";
  for (var i = input.length-1; i > -1; i--){
    result += input[i];
  }

  return result;
}

//Driver code

//Reverse "Hello World"
result = reverse("Hello World")

//Console.log if some condition is true
if (1 == 1){
console.log(result);
}