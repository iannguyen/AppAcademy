/* global EventEmitter */
/* global PokemonConstants */
/* global AppDispatcher */
/* global PokemonStore */
/* global React */
/* global ApiActions */
/* global ApiUtil */
/* global ToyIndexItem */

var ToyDetail = React.createClass({
  getInitialState: function(){
    return this.getStateFromStore();
  },

  getStateFromStore: function () {
    // debugger;
    var pokemon = PokemonStore.find(parseInt(this.props.params.pokemonId));
    var exist;
    if(pokemon && pokemon.toys){
      exist = true;
    }
    var toy;
    if(exist) {
    pokemon.toys.forEach(function (t) {
      if(t.id === parseInt(this.props.params.toyId)) { toy = t; }
      }.bind(this));
    }
    return { toy: toy };
  },

  componentDidMount: function () {
    PokemonStore.addPokemonsDetailChangeListener(this._onChange);
  },
  _onChange: function () {
    this.setState (this.getStateFromStore());
  },
  componentWillUnmount: function () {
    PokemonStore.removePokemonsDetailChangeListener(this._onChange);
  },
  componentWillReceiveProps: function () {
    ApiUtil.fetchPokemonById(this.props.params.pokemonId);
  },

  render: function () {
    return (
      <div>
          {
            this.state.toy ? <div className="detail">
                    Name: {this.state.toy.name} <br/>
                    Happiness:{this.state.toy.happiness} <br/>
                    Toy Price:{this.state.toy.price} <br/>
                    Toy Id:{this.state.toy.id} <br/>
                    <br/>
                    Toy Picture: <br/>
                    <img src={this.state.toy.image_url} />
                  </div> : <div></div>}
      </div>
    );
  }

});
