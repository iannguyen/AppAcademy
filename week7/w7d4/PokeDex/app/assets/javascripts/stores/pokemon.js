/* global EventEmitter */
/* global Dispatcher */
/* global PokemonConstants */
/* global AppDispatcher */
/* global PokemonStore */

(function(root) {
  'use strict';
  var CHANGE_EVENT = "CHANGE";
  var POKEMONS_INDEX_CHANGE_EVENT = "INDEX_CHANGE";
  var POKEMONS_DETAIL_CHANGE_EVENT = "DETAIL_CHANGE";

  var _pokemons = [];


  var resetPokemons = function(pokemons){
    _pokemons = pokemons;
  };

  var replaceSinglePokemon= function (pokemon) {
    var idx = -1;
    for(var i = 0; i < _pokemons.length; i++){
      if(pokemon.id === _pokemons[i].id){
        idx = i;
        break;
      }
    }
    if (idx !== -1){
      _pokemons.splice(idx, 1, pokemon);
      return true;
    }
    return false;
  };

  root.PokemonStore = $.extend({}, EventEmitter.prototype, {

    all: function(){
      // debugger;
      return _pokemons.slice();
    },
    indexChanged: function(){
      this.emit(POKEMONS_INDEX_CHANGE_EVENT);
    },

    detailChanged: function(){
      this.emit(POKEMONS_DETAIL_CHANGE_EVENT);
    },

    addPokemonsIndexChangeListener: function (callback) {
      this.on(POKEMONS_INDEX_CHANGE_EVENT, callback);
    },

    removePokemonsIndexChangeListener: function (callback) {
      this.removeListener(POKEMONS_INDEX_CHANGE_EVENT, callback);
    },

    addPokemonsDetailChangeListener: function (callback) {
      this.on(POKEMONS_DETAIL_CHANGE_EVENT, callback);
    },

    removePokemonsDetailChangeListener: function (callback) {
      this.removeListener(POKEMONS_DETAIL_CHANGE_EVENT, callback);
    },

    find: function(id){
      var poketemp = this.all();
      for (var i = 0; i < poketemp.length; i++) {
        if(poketemp[i].id === id){
          return poketemp[i];
        }
      }
    },

    dispatcherId: AppDispatcher.register(function(payload) {
      switch(payload.actionType){
        case PokemonConstants.POKEMONS_RECEIVED:
          resetPokemons(payload.pokemons);
          PokemonStore.indexChanged();
          break;
        case PokemonConstants.SINGLE_POKEMON_RECEIVED:
          if(replaceSinglePokemon(payload.pokemon)){
            PokemonStore.detailChanged();
          }
          break;
      }
    })
  });
}(this));
