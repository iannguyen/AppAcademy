Array.prototype.myEach = function(block) {
  for (var i = 0; i < this.length; i++) {
    block(this[i]);
  }

  return this;
};

// [1,2,3].myEach(function(el){
//   console.log(el + 2);
// });

Array.prototype.myMap = function(block) {
  var returnArray = [];
  this.myEach(function(el) {
    returnArray.push(block(el));
  });
  return returnArray;
};

// console.log ([1,2,3].myMap(function(el) {
//   return el + 3;
// }));

Array.prototype.myInject = function(block) {
  var accumulator = this[0];
  this.slice(1).myEach(function(el) {
    accumulator = block(accumulator, el);
  });
  return accumulator;
};

console.log( [1,2,3].myInject(function(accumulator, el) {
  return accumulator + el;
}));
