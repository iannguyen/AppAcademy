(function(root) {
  'use strict';

  $(document).keypress(function (key) {
    key = key.charCode.toString();
    KeyActions.keyDown(key);
  });

  $(document).keyup(function(key){
    key = (key.keyCode + 32).toString();
    KeyActions.keyUp(key);
  });

}(this));
