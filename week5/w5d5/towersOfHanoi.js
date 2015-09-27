var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

//var Hanoi = function() {
function Hanoi () {
  this.stacks = [[3,2,1],[],[]];
}

Hanoi.prototype.isWon = function (){
  if (this.stacks[1].equals([3,2,1]) || this.stacks[2].equals([3,2,1])) {
    return true;
  }
  return false;
};

Hanoi.prototype.isValidMove = function (startTowerIdx, endTowerIdx){
  if (this.stacks[endTowerIdx].length === 0 ||
      this.stacks[startTowerIdx].last() < this.stacks[endTowerIdx].last()){
    return true;
  }
  return false;
};

Hanoi.prototype.move = function (startTowerIdx, endTowerIdx){
  if (this.isValidMove(startTowerIdx, endTowerIdx)){
    this.stacks[endTowerIdx].push(this.stacks[startTowerIdx].pop());
    return true;
  }
  return false;
};

Hanoi.prototype.print = function () {
  console.log(JSON.stringify(this.stacks));
};

Hanoi.prototype.promptMove = function(callback) {
  reader.question("From where to where would you like to move?('2,1'): ", function(input) {
    input = input.split(",");
    var result = [];
    input.forEach(function(num){
      result.push(parseInt(num));
    });
    callback(result);
  });
};

Hanoi.prototype.run = function(completionCallBack) {
  this.print();
  var that = this;
  this.promptMove(function(choice) {
    if (that.move(choice[0],choice[1])){
      if(that.isWon()) {
        completionCallBack();
      }
      else {
        that.run(completionCallBack);
      }
    }else {
      console.log("ya fucked up");
      that.run(completionCallBack);
    }
  });
};

Array.prototype.last = function () {
  return this[this.length - 1];
};

Array.prototype.equals = function(otherArray){
  return (JSON.stringify(this) === JSON.stringify(otherArray));
};

var hanoi = new Hanoi();
hanoi.run(function(){
  console.log('a winner is you');
  reader.close();
});
