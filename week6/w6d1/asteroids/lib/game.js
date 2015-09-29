if (typeof Asteroids === 'undefined') {
  window.Asteroids = {};
}

var STARTASTEROIDS = 1;

var Game = window.Asteroids.Game = function () {
  this.asteroids = [];
  this.ship = new window.Asteroids.Ship();
  this.bullets = [];
  this.allObjects = this.asteroids.concat(this.ship);
};

Game.prototype.addAsteroids = function (ctx) {
  for (var i = 0; i < STARTASTEROIDS; i++) {
    var pos = [];
    pos[0] = Math.random() * window.innerWidth;
    pos[1] = Math.random() * window.innerHeight;
    // pos[0] = Math.random() * ctx.width;
    // pos[1] = Math.random() * ctx.height;

    var asteroid = new window.Asteroids.Asteroid(pos);
    this.asteroids.push(asteroid);
    this.allObjects.push(asteroid);
  }
};

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, 1000, 1000);
    ctx.fillStyle = "black";
    ctx.fillRect(0,0,window.innerWidth,window.innerHeight);
    this.allObjects.forEach(function(el) {
      el.draw(ctx);
      }
    );
  };

Game.prototype.moveObjects = function () {
  this.allObjects.forEach(function(el) {
    el.move();
    });
  };

Game.prototype.checkCollisions = function(ctx, interval){
  for(var i = 0; i < this.asteroids.length; i++){
    if(this.asteroids[i].collideWith(this.ship)){
      clearInterval(interval);
      this.gameOver(ctx);
      return;
    }
    for (var j = 0; j < this.bullets.length; j++) {
      if (this.asteroids[i].collideWith(this.bullets[j])) {
        this.asteroids[i].blowUp(ctx);
        this.asteroids.splice(i);
        // var index = this.allObjects.indexOf(this.asteroids[i]);
        // this.allObjects[index] = null;
      }
    }
    //we have ghost asteroids roaming around after their death.
    //FIX
    //LIMIT bullets
  }
};

Game.prototype.gameOver = function(ctx){
  this.allObjects = [];
  // ctx.fillStyle = "#000000";
  ctx.fillStyle = "white";
  ctx.font = "italic "+96+"pt Arial ";
  ctx.fillText("Game Over", 114,167);
};
