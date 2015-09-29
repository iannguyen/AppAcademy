var sum = function(){
  var args = Array.prototype.slice.call(arguments);
  var total = 0;
  args.forEach(function(el){
    total += el;
  });
  return total;
};

// sum(1,2,3,4,5);

Function.prototype.myBind = function(context){
  var fn = this;
  var args = Array.prototype.slice.call(arguments,1);
  // console.log(args);
  return function(){
    var subArguments = Array.prototype.slice.call(arguments);
    var fullArgs = args.concat(subArguments);
    return fn.apply(context,fullArgs);
  };
};

function Cat(name) {
  this.name = name;
}

Cat.prototype.says = function (sound) {
  console.log(this.name + " says " + sound + "!");
};

var markov = new Cat("Markov");
var breakfast = new Cat("Breakfast");

markov.says("meow");
// Markov says meow!

markov.says.myBind(breakfast, "meow")();
// Breakfast says meow!

var notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow");

var curriedSum = function(num){
  var array = [];
  var _curriedSum = function(number){
    if(array.length < num){
        array.push(number);
      // console.log(this);
    }
    if (array.length === num){
      var sum = 0;
      array.forEach(function(el){
        sum += el;
      });
      return sum;
    }
    else{
      return _curriedSum;
    }
  };
  return _curriedSum;
};

// console.log(curriedSum(3)(30)(20)(1));

Function.prototype.curry = function(num){
  var array = [];
  var that = this;
  var _curry = function(number){
    if(array.length < num){
        array.push(number);
      // console.log(this);
    }
    if (array.length === num){
      console.log(array);
      return that.apply(null, array);
      }
    else{
      return _curry;
    }
  };
  return _curry;
};

function blah (array) {
  console.log(array);
  array.forEach(function(el) {
    console.log(el);
  });
}

blah.curry(3)([1,2,3,4,5])(2)(1);
