/* global React */
/* global ReactRouter */
/* global PokemonsIndex */
/* global PokemonDetail */

var Router = ReactRouter.Router;
var Route = ReactRouter.Route;
var Index = React.createClass ({
  render: function () {
    return (<div>
      <h1> Pokemons </h1>
      <div className="pokemon-index"><PokemonsIndex /></div>
      {this.props.children}
    </div>
  );
  }
});

var routes = (
  <Route path="/" component={Index}>
    <Route path="pokemon/:pokemonId" components={{pokemonDetail: PokemonDetail, toys: ToysIndex}}  ></Route>
    <Route path="pokemon/:pokemonId/toys/:toyId" components={{pokemonDetail: PokemonDetail, toyDetail: ToyDetail}}></Route>
  </Route>

);


$(document).on("ready", function(e){
  React.render (
    <Router>{routes}</Router>,
    document.getElementById("pokedex")
  );

});
