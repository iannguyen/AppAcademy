# BenchBnB

![screenshot]
[screenshot]: ./images/benchbnb.png

BenchBnB is a side-project that integrates the GoogleMaps API, built on Rails and FLUX/React.js.

### Setup

Download the repo, navigate to the root app directory and run `bundle install`. Type `rails s` to start the server and open up your browser and type `localhost:3000`. 

### Features

- Click on the map to create a new `Bench` at the specified `coordinates`.
- GoogleMaps `marker` will appear on the home map. By moving the map and changing the viewable `boundaries`, Bench markers along with their respective descriptions will be not be displayed if they are out of the map's current visible boundaries.

### ToDo

- Bring it to life
- Apply `filters` for bench seating capacity
- Add a `Bench` show page
- Add `Reviews` for benches
- Make it more prettiful.
