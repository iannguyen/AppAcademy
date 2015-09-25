var Cat = function (name, owner) {
  this.name = name,
  this.owner = owner
  // this.cuteStatement = function() {
  //   return this.owner + " loves " + this.name;
  // }
}

Cat.prototype.cuteStatement = function() {
  return "Everyone loves " + this.name;
}

var bertrand = new Cat ('bertrand', 'ian');
console.log(bertrand.cuteStatement())

bertrand.cuteStatement = function() {
  return "idk, bertrand";
}

console.log(bertrand.cuteStatement());

Cat.prototype.meow = function () {
  return "MEOW";
}

var gizmo = new Cat('gizmo', 'ian');
console.log(gizmo.meow());
