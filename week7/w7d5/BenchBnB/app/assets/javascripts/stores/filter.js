(function(root) {
  'use strict';

  var _filters = {
    min: null,
    max: null,
  };

  var FILTER_EVENT = "FILTER";

  var resetFilters = function(filters) {
    _filters = filters;
  };

  root.FiltersStore = $.extend({}, EventEmitter.prototype, {
    all: function () {
      return _filters.slice();
    },

    changed: function () {
      this.emit(FILTER_EVENT);
    },

    addChangeListener: function (callback) {
      this.on(FILTER_EVENT, callback);
    },

    removeChangeListener: function (callback) {
      this.removeListener(FILTER_EVENT, callback);
    },

    dispatcherID: AppDispatcher.register(function(payload) {
      switch (payload.actionType){
        case (BenchConstants.FILTERS_RECEIVED):
          FiltersStore.resetFilters(payload.filters);
          FiltersStore.changed();
          break;
      }
    })
  });

}(this));
