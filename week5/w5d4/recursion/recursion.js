function exp1(base, power) {
  if (power === 0) {
    return 1;
  }
  else {
    return base * exp1(base, power-1);
  }
}

// console.log(exp1(2, 5));

function exp2(base, power) {
  if (power === 0) {
    return 1;
  }
  else if (power % 2 === 0) {
    return Math.pow(exp2(base, power/2),2);
  }
  else if (power % 2 === 1) {
    return base * Math.pow(exp2(base, (power-1)/2),2);
  }
}

function fibonacci(numbers) {
  if (numbers === 1) {
    return [0];
  }
  else if (numbers === 2) {
    return [0,1];
  }
  var prevFib = fibonacci(numbers - 1);
  return prevFib.concat(prevFib[prevFib.length-1] + prevFib[prevFib.length-2]);
}

// console.log(fibonacci(10));

function bSearch(array, number) {
  var midPoint = Math.floor(array.length / 2);
  if (array.length === 0) {
    return null;
  }
  else if (array.length === 1 && array[midPoint] === number) {
    return midPoint;
  }
  var left = array.slice(0, midPoint);
  var right = array.slice(midPoint + 1, array.length);
  if (array[midPoint] === number) {
    return midPoint;
  }
  else if (left[left.length-1] < number) {
    return midPoint + 1 + bSearch(right, number);
  }
  else if (right[0] > number) {
    return bSearch(left, number);
  }
}

// console.log(bSearch([1,2,3,4,5,6,7], 6));

function makeChange(amount, coins) {
  if (amount === 0) {
    return [];
  }
  var bestChange = null;
  for (var i = 0; i < coins.length; i++) {
    if (coins[i] > amount) {
      continue;
    }
    var remainder = amount - coins[i];

    var remainingChange = makeChange(remainder, coins);
    if (remainingChange === null) {
      continue;
    }
    var currentChange = [coins[i]].concat(remainingChange);

    if (bestChange === null || (currentChange.length < bestChange.length)) {
      bestChange = currentChange;
    }
  }
  return bestChange;
}

// console.log(makeChange(14, [10,7,1]));

function mergeSort(array) {
  if (array.length === 1) {
    return array;
  }
  var midPoint = Math.floor(array.length/2);
  var left = array.slice(0, midPoint);
  var right = array.slice(midPoint);
  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
  var merged = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] > right[0]) {
      merged.push(right.shift());
    }
    else {
      merged.push(left.shift());
    }
  }
  return merged.concat(left).concat(right);
}

// console.log(mergeSort([3,2,1,6,4,8,7]));

function subsets(array) {
  if (array.length === 0) {
    return [array];
  }
  var subs = [];
  var previous = subsets(array.slice(0, array.length-1));
  for (var i = 0; i < previous.length; i++) {
    var newEl = previous[i].concat(array[array.length-1]);
    subs.push(newEl);
  }
  return subs.concat(previous);
}

console.log(subsets([1,2,3]));
