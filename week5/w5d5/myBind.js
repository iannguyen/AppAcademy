Function.prototype.myBind = function (context) {
  var fn = this;
  return function () {
    return fn.apply(context);
  };
};

var Cat = function (name) {
  this.name = name;
};

Cat.prototype.meow = function () {
  console.log(this.name + ' meows.');
  return "return value";
};

var pusheen = new Cat('Pusheen');
// setInterval(pusheen.meow.myBind(pusheen), 1000);

var f = pusheen.meow.myBind(pusheen);
//step1 : function () {
//   console.log(this.name + ' meows.');
//   return "return value";
// };.myBind(pusheen);

//step2 : f = function () {
//   console.log(this.name + ' meows.');
//   return "return value";
// };. apply(pusheen)

console.log(f());
