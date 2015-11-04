# PokeDex

![screenshot]
[screenshot]: ./images/pokedex.png

PokeDex is one of the first single-page web applications I worked on using `React-Router`, and `React.js/FLUX`.

### Setup

Download the repo, navigate to the root app directory and run `bundle install`. Type `rails s` to start the server and open up your browser and type `localhost:3000`.

### Features

- Navigate through a list of `pokemon` and select one to have `pokemonDetail` display on the same page via `React` and `#pushState`.
- `PokemonDetail` information is fetched by the `pokemonId` in query params, as well as the `Toys` that each Pokemon owns.
- Multiple React components displayed based on the current `route` for a pokedex 'feel'.
