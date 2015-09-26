var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question('Enter a number.', function(reply) {
      var number = parseInt(reply);
      sum += number;
      console.log('The current sum is ' + sum);
      addNumbers(sum, numsLeft-1, completionCallback);
    });
  } else {
    completionCallback(sum);
  }
}

addNumbers(0, 3, function(number) {
  console.log("FINISHED! " + number);
  reader.close();
});
