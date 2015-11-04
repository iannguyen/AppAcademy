(function(root) {
  'use strict';

  root.ApiUtil = {
    fetchBenches: function(boundaries) {
      $.ajax({
        url: 'api/benches',
        method: 'get',
        data: boundaries,
        datatype: 'json',
        success: function (response) {
          ApiActions.receiveAll(response);
        }
      });
    },

    fetchSingleBench: function (id) {
      $.ajax({
        url: 'api/benches/' + id,
        success: function (response) {
          ApiActions.receiveSingleBench(response);
        }
      });
    },

    createBench: function(bench) {
      $.ajax({
        url: 'api/benches',
        method: 'post',
        data: {bench: bench},
        datatype: 'json',
        success: function(response) {
          ApiActions.receiveSingleBench(response);
        }
      });
    }
  };

}(this));
