  if (typeof Asteroids === 'undefined') {
    window.Asteroids = {};
  }
  var A = window.Asteroids;

  A.MovingObject = function (pos, vel, radius, color) {
    this.pos = pos;
    this.vel = vel;
    this.radius = radius;
    this.color = color;
  };

  // var whatever = MovingObject.prototype;

  A.MovingObject.prototype.draw = function (ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();

    ctx.arc(
      this.pos[0],
      this.pos[1],
      this.radius,
      0,
      2 * Math.PI,
      false
    );
    ctx.fill();
  };

  A.MovingObject.prototype.wrap = function(){
    if(this.pos[0] > window.innerWidth + 50){
      this.pos[0] = 0;
    }
    if(this.pos[1] > window.innerHeight + 50){
      this.pos[1] = 0;
    }
    if(this.pos[0] < -50){
      this.pos[0] = window.innerWidth;
    }
    if(this.pos[1] < -50){
      this.pos[1] = window.innerHeight;
    }
  };

  A.MovingObject.prototype.move = function () {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    this.wrap();
  };
