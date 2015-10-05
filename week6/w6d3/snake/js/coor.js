(function () {
  if (typeof window.SnakeGame === 'undefined') {
    window.SnakeGame = {};
  }

  var SnakeGame = window.SnakeGame;
  
  var Coord = SnakeGame.Coord = function(pos) {
    this.pos = pos;
    this.x = pos[0];
    this.y = pos[1];
  };

  Coord.prototype.plus = function(coord) {
    this.x += coord.x;
    this.y += coord.y;
  };

  Coord.prototype.equals = function(coord) {
    return this.x === coord.x && this.y === coord.y;
  };

  Coord.prototype.isOpposite = function (coord) {
    //until then
  };
})();
