function Clock () {
  this.timeNow = null;
}

Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  var hours = this.timeNow.getHours();
  var minutes = this.timeNow.getMinutes();
  var seconds = this.timeNow.getSeconds();
  console.log(hours + ':' + minutes + ':' + seconds);
};

Clock.prototype.run = function () {
  // 1. Set the timeNow.
  this.timeNow = new Date();
  // 2. Call printTime.
  this.printTime();
  // 3. Schedule the tick interval.
  setInterval(this._tick.bind(this), Clock.TICK);
};

Clock.prototype._tick = function () {
  // 1. Increment the timeNow.
  var that = this;
  this.timeNow.setSeconds(that.timeNow.getSeconds() + Clock.TICK/1000);
  // 2. Call printTime.
  return this.printTime();
};

var clock = new Clock();
clock.run();
