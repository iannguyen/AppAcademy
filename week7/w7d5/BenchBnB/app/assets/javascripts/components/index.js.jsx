var Index = React.createClass({
  getInitialState: function () {
    return (
      { benches: BenchStore.all() }
    );
  },

  componentDidMount: function () {
    BenchStore.addChangeListener(this._onChange);
    // ApiUtil.fetchBenches();
  },

  componentWillUnmount: function () {
    BenchStore.removeChangeListener(this._onChange);
  },

  _onChange: function () {
    this.setState({ benches: BenchStore.all() });
  },

  render: function () {
    return (
      <div>
        {
          this.state.benches.map(function (bench){
            return (
              <div>
                { bench.description }
              </div>
            );
          })
        }
      </div>
    );
  }
});
