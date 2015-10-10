/* global EventEmitter */
/* global PokemonConstants */
/* global AppDispatcher */
/* global PokemonStore */
/* global React */
/* global ApiActions */
/* global ReactRouter */
/* global ApiUtil */

var PokemonIndexItem = React.createClass ({
  mixins: [ReactRouter.History],
  showDetail: function () {
    var pokemonURL = "pokemon/" + this.props.pokemon.id;
    this.history.pushState(null, pokemonURL);
  },
  render: function () {
    return (
      <li onClick={this.showDetail} className="poke-list-item">Name: {this.props.pokemon.name}, Type: {this.props.pokemon.poke_type}</li>
    );
  }
});
