if (typeof Asteroids === 'undefined') {
  window.Asteroids = {};
}

var A = window.Asteroids;

var COLOR = ["#00FF00", "#0000FF", "#C0C0C0", "#FFFF00", "#800080", "#FF00FF"];
var RADIUS = 25;
A.Asteroid = function(pos, radius){
  var that = this;
  A.MovingObject.call(this, pos, A.Util.randomVector(),
    RADIUS, COLOR[Math.floor(Math.random()*COLOR.length)]);
};
A.Util.inherits(A.Asteroid, A.MovingObject);

A.Asteroid.prototype.collideWith = function(object){
   if(this.radius + object.radius > A.Util.distance(this, object)){
     return true;
   }
};

A.Asteroid.prototype.blowUp = function(ctx){
    this.color = "#000000";
};
