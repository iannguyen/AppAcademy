var Board = require('./board');

var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var Game = function () {
  this.board = new Board();
};

Game.prototype.play = function (callback) {
  // console.log(callback());
  this.board.printBoard();
  var that = this;
  this.getMove(function(move, mark) {
    if (that.board.empty(move[0], move[1])) {
      that.board.placeMark(move[0], move[1], mark);
    }
    else {
      console.log("AHH =/");
    }
    if (that.board.won() || that.board.over()) {
      reader.close();
      callback();
    } else {
      that.play(callback);
    }
  });
};

Game.prototype.getMove = function (callback) {
  reader.question("Where would you like to move?: ('1,2')", function(pos) {
    reader.question("What mark?: ('x' or 'o')", function(mark) {
      var position = pos.split(',');
      var result = [];
      position.forEach(function(coordinate) {
        result.push(parseInt(coordinate));
      });
    callback(result, mark);
    });
  }
);};

module.exports = Game;
