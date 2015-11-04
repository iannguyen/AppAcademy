(function(root) {
  'use strict';

  var _benches = [];
  var CHANGE_EVENT = "CHANGE";

  var resetBenches = function (benches) {
    _benches = benches;
  };

  root.BenchStore = $.extend({}, EventEmitter.prototype, {
    all: function () {
      return _benches.slice();
    },

    changed: function() {
      this.emit(CHANGE_EVENT);
    },

    addChangeListener: function(callback) {
      this.on(CHANGE_EVENT, callback);
    },

    removeChangeListener: function(callback) {
      this.removeListener(CHANGE_EVENT, callback);
    },

    dispatcherID: AppDispatcher.register(function(payload) {
      switch (payload.actionType){
        case BenchConstants.BENCHES_RECEIVED:
          resetBenches(payload.benches);
          BenchStore.changed();
          break;
        case BenchConstants.BENCH_RECEIVED:
          _benches.push(payload.bench);
          BenchStore.changed();
          break;
      }
    })
  });

}(this));
