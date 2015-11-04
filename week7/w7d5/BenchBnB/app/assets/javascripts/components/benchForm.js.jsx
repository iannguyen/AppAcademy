var BenchForm = React.createClass({
 mixins: [ReactRouter.History],

  getInitialState: function() {
    return {
      description: '',
      lat: this.props.location.query.lat,
      lng: this.props.location.query.lng,
      seating: ''
    };
  },

  createBench: function (e) {
    e.preventDefault();
    var that = this;
    var bench = {
      lat: e.currentTarget.lat.value,
      lng: e.currentTarget.lng.value,
      seating: e.currentTarget.seating.value,
      description: e.currentTarget.description.value
    };
    ApiUtil.createBench(bench);
    this.props.history.pushState(null, "/");
  },

  render: function () {
    return (
      <form className='bench' onSubmit={this.createBench}>
        <div>
          <label htmlFor='bench_lat'>Latitude:</label><br />
          <input type="number" ref='lat' id="lat" value={this.state.lat}/>
        </div>

        <br />

        <div>
          <label htmlFor='bench_lng'>Longitude:</label><br />
          <input type="number" ref='lng' id="lng" value={this.state.lng}/>
        </div>

        <br />

        <div>
          <label htmlFor='bench_seating'>Seating:</label><br />
          <input type="number" ref='lng' id="seating"/>
        </div>

        <br />

        <div>
          <label htmlFor='bench_description'>Description:</label><br />
          <textarea ref='description' id='description'></textarea>
        </div>

        <br />

        <button>Create Bench</button>
      </form>
    );
  }
});
