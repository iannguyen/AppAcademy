var ticTacToe = require('./ttt/index.js');

var game = new ticTacToe.Game();
game.play(function() {
  console.log("Game over nerd.");  
});
