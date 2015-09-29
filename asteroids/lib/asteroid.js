if (typeof Asteroids === 'undefined') {
  window.Asteroids = {};
}

var A = window.Asteroids;

var COLOR = ["#00FF00", "#0000FF", "#C0C0C0", "#FFFF00", "#800080", "#FF00FF"];
var RADIUS = 25;
A.Asteroid = function(pos, radius){
  var that = this;
  var options = {
    pos: pos,
    vel: A.Util.randomVector(),
    radius: radius || RADIUS,
    color: COLOR[Math.floor(Math.random()*COLOR.length)]
  };
  A.MovingObject.call(that, options);
};
A.Util.inherits(A.Asteroid, A.MovingObject);

A.Asteroid.prototype.collideWith = function(object){
   if(this.radius + object.radius > A.Util.distance(this, object)){
     return true;
   }
};

A.Asteroid.prototype.blowUp = function(ctx){
    this.color = "#000000";
    this.radius = 0;
    this.pos = [-1,-1];
    this.vel = 0;
};
