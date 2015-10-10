/* global EventEmitter */
/* global PokemonConstants */
/* global AppDispatcher */
/* global PokemonStore */
/* global React */
/* global ApiActions */
/* global ApiUtil */

var PokemonsIndex = React.createClass ({
  getInitialState: function () {
    return (
      { pokemons: PokemonStore.all() }
    );
  },
  componentDidMount: function () {
    PokemonStore.addPokemonsIndexChangeListener(this._onChange);
    ApiUtil.fetchAllPokemon();
  },
  _onChange: function () {
    this.setState ({ pokemons: PokemonStore.all() });
  },
  componentWillUnmount: function () {
    PokemonStore.removePokemonsIndexChangeListener(this._onChange);
  },

  render: function () {
    return (
      <ul>
      {
          this.state.pokemons.map (function(pokemon, idx){
          return <PokemonIndexItem key={idx} pokemon={pokemon} />;
        }.bind(this))
      }
    </ul>
    );
  }
});
