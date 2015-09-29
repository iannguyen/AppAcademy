if (typeof Asteroids === 'undefined') {
  window.Asteroids = {};
}

var A = window.Asteroids;

window.Asteroids.GameView = function(game, ctx) {
  this.ctx = ctx;
  this.game = game;
};

A.GameView.prototype.start = function(){
  var interval = setInterval(function() {
    this.game.moveObjects();
    this.game.draw(this.ctx);
    this.game.checkCollisions(this.ctx, interval);
  }, 1000 / 60);
};

A.GameView.prototype.bindKeyHandlers = function(game) {
  window.key('space', function () {
  game.ship.fireBullet(game);
  });
  window.key('left', function () {
  game.ship.power([-1,0]);
  });
  window.key('right', function () {
  game.ship.power([1,0]);
  });
  window.key('up', function () {
  game.ship.power([0,-1]);
  });
  window.key('down', function () {
  game.ship.power([0,1]);
  });
};
