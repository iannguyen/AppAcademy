/* global EventEmitter */
/* global PokemonConstants */
/* global AppDispatcher */
/* global PokemonStore */
/* global React */
/* global ApiActions */
/* global ApiUtil */

var PokemonDetail = React.createClass({
  getInitialState: function(){
    return {pokemon: this.getStateFromStore()};
  },

  componentDidMount: function () {
    PokemonStore.addPokemonsDetailChangeListener(this._onChange);
    ApiUtil.fetchPokemonById(this.props.params.pokemonId);
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
  componentWillReceiveProps: function () {
    ApiUtil.fetchPokemonById(this.props.params.pokemonId);
  },
  render: function () {
    return (
      <div>
        {this.state.pokemon ? <div className="detail">
                  Name: {this.state.pokemon.name} <br/>
                  Attack:{this.state.pokemon.attack} <br/>
                  Defense:{this.state.pokemon.defense} <br/>
                  PokeType:{this.state.pokemon.poke_type} <br/>
                  <ol>Moves: {
                    this.state.pokemon.moves.map(function(move, idx){
                      return <li>{idx+1}: {move}</li>;
                    })
                  }
                  <br/>
                  </ol>
                  <br/>
                  Portrait: <br/>
                  <img src={this.state.pokemon.image_url} />
                </div> : <div></div>}
      </div>
    );
  }
});
