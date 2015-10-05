(function () {
  if (typeof Hanoi === "undefined") {
    window.Hanoi = {};
  }

  var View = Hanoi.View = function (game, $el) {
    this.game = game;
    this.$el = $el;
  };

  View.prototype.setUpBoard = function () {
    $('.board').append("<ul class='stacks'></ul>");
    for (var i = 0; i < 3; i++) {
      var $stack = $("<li></li>");
      $stack.data("number", i);
      $('.stacks').append($stack);
    }

    for (var j = 0; j < 3; j++) {
      var $disk = $('<div class="disk"></div>');
      $disk.addClass("disk-"+j);
      $disk.data("number", j);
      $('.stacks li').first().append($disk);
    }
  };

  //delegate target to li
  //use one event handler function to check if there's a current disk and act
  //accordingly
  View.prototype.bindEvents = function () {
    var that = this;
    this.$firstStack = null;
    this.$el.on('click', "li", function(e) {
      // debugger;
      var $clickStack = $(e.currentTarget);
      if (that.$firstStack) {
        that.makeMove(that.$firstStack, $clickStack);
        that.$firstStack = null;
      } else {
        that.$firstStack = $clickStack;
      }
    });
  };

  View.prototype.makeMove = function ($firstStack, $endStack) {
    // debugger
    if (this.game.move($firstStack.data("number"), $endStack.data("number"))) {
      var $disk = $($firstStack.children().first());
      $disk.remove();
      $endStack.prepend($disk);

      if (this.game.isWon()) {
        alert('congratulations!');
      }
      
    } else {
      debugger;
      alert('invalid move');
    }
  };
})();
