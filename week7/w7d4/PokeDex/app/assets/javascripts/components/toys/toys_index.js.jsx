/* global EventEmitter */
/* global PokemonConstants */
/* global AppDispatcher */
/* global PokemonStore */
/* global React */
/* global ApiActions */
/* global ApiUtil */
/* global ToyIndexItem */

var ToysIndex = React.createClass ({

  getInitialState: function(){
    return {pokemon: this.getStateFromStore()};
  },

  componentDidMount: function () {
    PokemonStore.addPokemonsDetailChangeListener(this._onChange);
  },
  _onChange: function () {
    this.setState ({ pokemon: this.getStateFromStore() });
  },
  componentWillUnmount: function () {
    PokemonStore.removePokemonsDetailChangeListener(this._onChange);
  },

  getStateFromStore: function(){
    var id = this.props.params.pokemonId.toString();
    return PokemonStore.find(parseInt(id));
  },

  render: function () {
    var toys = [];
    if(this.state.pokemon){
      toys = this.state.pokemon.toys || [];
    }
    return (
        <div>
      {
        toys.map(function(toy, idx) {
          return <ToyIndexItem key={idx} toy={toy} />;
        })
      }
        </div>
    );
  }
});
