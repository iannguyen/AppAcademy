if (typeof Asteroids === 'undefined') {
  window.Asteroids = {};
}

var A = window.Asteroids;

A.Bullet = function (ship) {
  this.pos = ship.pos.slice();
  this.vel = [ship.vel[0]*2, ship.vel[1]*2];
  this.radius = 5;
  this.color = "#FFFFFF";
  return this;
};

A.Util.inherits(A.Bullet, A.MovingObject);
