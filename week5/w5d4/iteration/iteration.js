function bubbleSort(array) {
  var sorted = false;
  while (sorted === false) {
    sorted = true;
    for (var i=0; i < ((array.length)-1); i++) {
      if (array[i] > array[i + 1]) {
        var temp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = temp;
        sorted = false;
      }
    }
  }
  return array;
}

// console.log(bubbleSort([6,1,5,4,3,7,2]));

function substrings(string) {
  var subs = [];
  for (var i = 0; i < (string.length); i++) {
    for (var j = i + 1; j <= (string.length); j++) {
      subs.push(string.slice(i,j));
    }
  }
}

console.log(substrings('hello'));
