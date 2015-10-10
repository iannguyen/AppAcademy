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
        },
        failure: function(response) {
          console.log(response);
        }
      });
    }
  };

}(this));
