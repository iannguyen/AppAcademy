if (typeof Asteroids === 'undefined') {
  window.Asteroids = {};
}
  var Util = window.Asteroids.Util = {};

  Util.inherits = function (child, parent) {
    function Surrogate() {}
    Surrogate.prototype = parent.prototype;
    child.prototype = new Surrogate ();
    child.prototype.constructor = child;
  };

  Util.randomVector = function(){
    var vel = [];
    vel[0] = Math.random();
    vel[1] = Math.random();
    var negatives = Math.random();
    if(negatives < 0.25){
      vel[0] = vel[0] * -1;
    }
    else if(negatives < 0.5){
      vel[1] = vel[1] * -1;
    }
    else if(negatives < 0.75){
      vel[1] = vel[1] * -1;
      vel[0] = vel[0] * -1;
    }
    // var speed = Math.random(); //or a set speed
    // vel[1] = Math.sqrt(Math.pow(vel[0],2) - Math.pow(speed,2));
    return vel;
  };

  Util.distance = function(object1, object2) {
    return Math.sqrt(Math.pow((object1.pos[0]- object2.pos[0]), 2) + Math.pow((object1.pos[1] - object2.pos[1]), 2));
  };
