Array.prototype.unique = function() {
  var newObject = {};
   var uniques = [];
  for (var i = 0; i < this.length; i++) {
    newObject[this[i]] = this[i];
  }
  for (var j in newObject) {
    uniques.push(newObject[j]);
  }
  return uniques;
};

// console.log([1,2,3,2,1].unique());

Array.prototype.twosum = function() {
  var arr = [];
  for (var i = 0; i < this.length; i++){
    for (var j = i+1; j < this.length; j ++){
      if (this[i] + this[j] === 0) {
        arr.push([i, j]);
      }
    }
  }
  return arr;
};

// console.log([-1, 0, 2, -2, 1].twosum());

Array.prototype.transpose = function() {
  var arr = [];
  for (var k = 0; k < this.length; k++) {
    arr.push([]);
  }
  for (var i = 0; i < this.length; i++){
    for (var j = 0; j < this[0].length; j++){
      arr[j].push(this[i][j]);
    }
  }
  return arr;
};

// console.log([[0, 1, 2],[3, 4, 5],[6, 7, 8]].transpose());
