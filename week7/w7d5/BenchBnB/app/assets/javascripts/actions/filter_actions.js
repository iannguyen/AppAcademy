(function(root) {
  'use strict';

  root.FilterActions = {
    updateFilters: function(filters) {
      AppDispatcher.dispatch({
        actionType: BenchConstants.FILTERS_RECEIVED,
        filters: filters
      });
    }
  };

}(this));
