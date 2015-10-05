(function () {
  if (typeof window.SnakeGame === 'undefined') {
    window.SnakeGame = {};
  }

  var SnakeGame = window.SnakeGame;
  var Board = SnakeGame.Board = function () {
    this.snake = new SnakeGame.Snake();
    this.apples = [];

    this.createGrid();
  };

  Board.prototype.createGrid = function () {
    var grid = [];

    for (var i = 0; i < 20; i++) {
      grid.push([]);
      for (var j = 0; j < 20; j++) {
        grid[i].push([]);
      }
    }

    this.grid = grid;
  };

  Board.prototype.update = function () {

  };

})();
