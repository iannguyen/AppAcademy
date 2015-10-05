(function () {
  if (typeof window.SnakeGame === 'undefined') {
    window.SnakeGame = {};
  }

  var SnakeGame = window.SnakeGame;

  var Snake = SnakeGame.Snake = function() {
    this.dir = "N";
    this.coord = new SnakeGame.Coord([10,10]);
    this.segments = [[10,10]];
  };

  Snake.DIRECTIONS = {
    'N': new SnakeGame.Coord([0,-1]),
    'S': new SnakeGame.Coord([0,1]),
    'E': new SnakeGame.Coord([1,0]),
    'W': new SnakeGame.Coord([-1,0])
  };

  Snake.prototype.move = function () {
    this.coord.plus(Snake.DIRECTIONS[this.dir]);
  };

  Snake.prototype.turn = function (dir) {
    this.dir = dir;
  };
})();
