(function(root) {
  'use strict';

  root.KeyActions = {
    keyDown: function(key){
      var action = {
        actionType: KeyConstants.KEY_DOWN,
        key: key
      };

      AppDispatcher.dispatch(action);
    },
    keyUp: function(key) {
      var action = {
        actionType: KeyConstants.KEY_UP,
        key: key
      };

      AppDispatcher.dispatch(action);
    },

    keyReset: function(keys){
      var action = {
        actionType: KeyConstants.KEY_RESET,
        keys: keys
      };

      AppDispatcher.dispatch(action);
    }
  };

}(this));
