(function(root) {
  'use strict';

  var _keys = [];
  var CHANGE_EVENT = "CHANGE";

  root.KeyStore = $.extend({}, EventEmitter.prototype, {
    all: function(){
      return _keys.slice();
    },
    addKey: function(key){
      if (_keys.indexOf(key) === -1) {
        _keys.push(key);
      }
    },
    removeKey: function(key){
      var idx = _keys.indexOf(key);
      if(idx !== -1){
        _keys.splice(idx, 1);
      }
    },
    resetKeys: function(keys){
      _keys = keys;
    },
    addChangeHandler: function(handler){
      KeyStore.on(CHANGE_EVENT, handler);
    },
    removeChangeHandler: function(handler){
      KeyStore.removeListener(CHANGE_EVENT, handler)
    },
    changed: function(){
      KeyStore.emit(CHANGE_EVENT);
    },
    dispatcherID: AppDispatcher.register(function(payload){
      switch(payload.actionType){
        case KeyConstants.KEY_DOWN:
          KeyStore.addKey(payload.key);
          KeyStore.changed();
          break;

        case KeyConstants.KEY_UP:
          KeyStore.removeKey(payload.key);
          KeyStore.changed();
          break;

        case KeyConstants.KEY_RESET:
          KeyStore.resetKeys(payload.keys);
          KeyStore.changed();
          break;
      }
    })
  });


}(this));
