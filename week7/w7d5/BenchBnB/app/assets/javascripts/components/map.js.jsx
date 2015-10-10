var Map = React.createClass({
  getInitialState: function () {
    return { markers: [], bounds: [] };
  },

  componentDidMount: function () {
    var map = React.findDOMNode(this.refs.map);
    var mapOptions = {
      center: { lat: 37.7758, lng: -122.435 },
      zoom: 13
    };
    this.map = new google.maps.Map(map, mapOptions);
    BenchStore.addChangeListener(this._onChange);
    this.renderMarkers();
  },

  getMapBounds: function () {
    var bounds = this.map.getBounds();
    var north = bounds.getNorthEast().J;
    var south = bounds.getSouthWest().J;
    var east = bounds.getNorthEast().M;
    var west = bounds.getSouthWest().M;
    var limits = {boundaries: {north: north, south: south, east: east, west: west}};
    return limits;
  },

  componentWillUnmount: function () {
    BenchStore.removeChangeListener(this._onChange);
  },

  _onChange: function () {
    this.benches = BenchStore.all();
    this.generateMapMarkers();
  },

  generateMapMarkers: function () {
    var that = this;
    // console.log(this.benches);
    for (var i = 0; i < this.benches.length; i++) {
      var coordinates = new google.maps.LatLng(this.benches[i].lat, this.benches[i].lng);
      var marker = new google.maps.Marker({
        position: coordinates,
        title: this.benches[i].description
      });
      this.state.markers.push(marker);
    }
    this.setMarkers();
  },

  setMarkers: function () {
    var that = this;
    this.state.markers.forEach(function(marker) {
      marker.setMap(that.map);
    });
  },

  renderMarkers: function () {
    this.map.addListener('idle', function() {
      var bounds = this.getMapBounds();
      ApiUtil.fetchBenches(bounds);
    }.bind(this));
  },

  render: function () {
    return (
      <div className='map' ref='map'>
        Map should be here.
      </div>
    );
  }
});
