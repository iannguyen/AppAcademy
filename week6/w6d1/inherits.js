Function.prototype.inherits = function (parent) {
  var Surrogate = function () {};
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate ();
  this.prototype.constructor = this;
};

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

MovingObject.prototype.move = function () {
  console.log('MOVED');
};

var chris = new Asteroid ();
chris.move();
