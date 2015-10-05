(function () {
  if (typeof TTT === "undefined") {
    window.TTT = {};
  }

  var View = TTT.View = function (game, $el) {
    this.game = game;
    this.$el = $el;
  };

  View.prototype.bindEvents = function () {
    this.$el.on("click", function(e) {
      console.log('Hi');
      //e.target needs to be jquery object
      var $square = $(e.target);
      //pull pos by ('pos') on data

      this.makeMove($square);
    }.bind(this));
  };

  View.prototype.makeMove = function ($square) {
    try {
      var currentPlayer = this.game.currentPlayer;
      this.game.playMove($square.data("pos"));
      $square.append(currentPlayer);
    } catch(e) {
      alert('invalid move!');
    }

    if(this.game.winner()) {
      alert(this.game.winner() + 'wins!');
    } else if (this.game.isOver()) {
      alert('cats game');
    }
  };

  View.prototype.setupBoard = function () {
    $(".grid").append("<ul class='square'></ul>");

    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        var $tile = $("<li></li>");
        $tile.data("pos", [i, j]);
        $(".square").append($tile);
      }
    }
  };
})();
