var Search = React.createClass({
  getInitialState: function () {
    return { min: null, max: null };
  },

  _onChange: function () {

  },

  handleMapClick: function (coordinates) {
    this.props.history.pushState(null, "benches/new", coordinates);
  },

  render: function () {
    return (
      <div>
        <Map handleMapClick={this.handleMapClick}/>
        <Index />
      </div>
    );
  }
});
