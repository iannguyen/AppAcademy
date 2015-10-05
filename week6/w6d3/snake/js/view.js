(function () {
  var SnakeGame;

  if (typeof window.SnakeGame === 'undefined') {
    window.SnakeGame = {};
  }

  SnakeGame = window.SnakeGame;
  var View = SnakeGame.View = function($el, snake) {
    this.$el = $el;
    this.board = new SnakeGame.Board();
    this.snake = snake;
    this.bindEvents();

    setInterval(this.step.bind(this), 2000);
  };

  View.prototype.setUp = function() {
    for (var i = 0; i < 20; i++) {
      // $('.board').append("<div class='columns'></div>");
      for (var j = 0; j < 20; j++) {
        var $square = $("<div class='square'></div>");
        $square.data("pos", [i,j]);
        $('.board').append($square);
      }
    }
  };

  View.prototype.update = function () {

    this.snake.segments
  };

  View.prototype.bindEvents = function() {
    var that = this;
    this.$el.on("keyup", function(e) {
      that.snake.turn("N");
    });

    this.$el.on("keydown", function(e) {
      that.snake.turn("S");
    });

    this.$el.on("keyright", function(e) {
      that.snake.turn("E");
    });

    this.$el.on("keyleft", function(e) {
      that.snake.turn("W");
    });
  };

  View.prototype.step = function () {
    this.snake.move();
    // this.board.render();
  };

})();
