if (typeof Asteroids === 'undefined') {
  window.Asteroids = {};
}
var A = window.Asteroids;

A.Ship = function(pos, radius){
  var that = this;
  A.MovingObject.call(this, [300, 300], [0,0], 10, "#FF0000");
};

A.Util.inherits(A.Ship, A.MovingObject);

A.Ship.prototype.power = function (impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
};

A.Ship.prototype.fireBullet = function (game) {
  var bullet = new A.Bullet(this);
  game.bullets.push(bullet);
  game.allObjects.push(bullet);
};
