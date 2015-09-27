var Board = function () {
  this.grid = [
    ['x', 'x', null],
    [null, null, null],
    [null, null, null]
  ];
};

Board.prototype.printBoard = function () {
  console.log(this.grid[0]);
  console.log(this.grid[1]);
  console.log(this.grid[2]);
};

Board.prototype.over = function () {
  for (var i = 0; i < this.grid.length; i++) {
    for (var j = 0; j < this.grid.length; j++) {
      if (this.empty(i,j)) {
        return false;
      }
    }
  }
      return true;
};

Board.prototype.won = function () {
  var diagonals = [
    [this.grid[0][0], this.grid[1][1], this.grid[2][2]],
    [this.grid[0][2], this.grid[1][1], this.grid[2][0]]
  ];
  var newGrid = this.grid.concat(this.grid.transpose()).concat(diagonals);
  return this.winningRow(newGrid);
};

Board.prototype.winningRow = function(possibilities) {
  for(var i = 0; i < possibilities.length; i++){
    if(possibilities[i].equals(["x","x","x"]) || possibilities[i].equals(["o","o","o"])){
      return true;
    }
  }
  return false;


  // possibilities.forEach(function(row) {
  //   // console.log(row);
  //   if (row.equals(['x','x','x']) || row.equals(['o','o','o'])) {
  //     return true;
  //   }
  // });
  //   return false;
};

Array.prototype.equals = function(other) {
  return (JSON.stringify(this) === JSON.stringify(other));
};

Array.prototype.transpose = function () {
  var result = [];
  var rowLength = this.length;
  var colLength = this[0].length;
  for (var i = 0; i < colLength; i++) {
  //  result[i] = [];
    var newRow = [];
    for (var j = 0; j < rowLength; j++) {
  //    return result[i].push(this[j][i]);
      newRow.push(this[j][i]);
    }
    result.push(newRow);
  }
  return result;
};

Board.prototype.empty = function (x,y) {
  if (this.grid[x][y] === null) {
    return true;
  } else {
    return false;
  }
};

Board.prototype.placeMark = function (x, y, mark) {
  this.grid[x][y] = mark;
};

module.exports = Board;
