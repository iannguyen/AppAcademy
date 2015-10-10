(function(root) {
  'use strict';

  root.ApiUtil = {
    fetchAllPokemon: function () {
      $.ajax ({
        url: 'api/pokemon',
        method: 'get',
        dataType: 'json',
        success: function(response) {
          ApiActions.receiveAllPokemons(response);
        }
      });
    },

    fetchPokemonById: function(id) {
      $.ajax ({
        url: 'api/pokemon/'+id,
        method: 'get',
        dataType: 'json',
        success: function(response) {
          ApiActions.receiveSinglePokemon(response);
        }
      });
    }

  };

}(this));
