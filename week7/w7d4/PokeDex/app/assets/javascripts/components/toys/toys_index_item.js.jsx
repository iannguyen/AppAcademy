/* global EventEmitter */
/* global PokemonConstants */
/* global AppDispatcher */
/* global PokemonStore */
/* global React */
/* global ApiActions */
/* global ApiUtil */
/* global ToyIndexItem */
/* global ReactRouter */

var ToyIndexItem = React.createClass ({
  mixins: [ReactRouter.History],
  showToyDetail: function () {
    var toyURL = "/pokemon/" + this.props.toy.pokemon_id + "/toys/" + this.props.toy.id;
    this.history.pushState(null, toyURL);
  },
  render: function () {
    return (
      <li onClick={this.showToyDetail} className="toy-list-item">
        {this.props.toy.name},
        {this.props.toy.happiness},
        {this.props.toy.price},
      </li>
    );
  }
});
