
(function (React) {

  var NAMES = [
    "nathan", 'ian', 'john', 'kenny', 'nicole', 'nathaniel'
  ];

  var AutoComplete = React.createClass({
    getInitialState: function() {
      return { search: "" ,matches: [] };
    },

    updateSearch: function(e) {
      var search = e.currentTarget.value;
      var searchRegExp = new RegExp("^" + search);
      var namesMatched = [];

      NAMES.forEach(function(name){
        if (name.match(searchRegExp) && search.length > 0) {
          namesMatched.push(name);
        }
      });

      this.setState({ matches: namesMatched, search: search });
    },

    fillSearch: function(e) {
      var name = e.currentTarget.innerText;
      this.setState({search: name, matches: [name]});
    },

    render: function () {
      return (
          <div>
            <input onInput={ this.updateSearch } type="text" value={this.state.search}></input>
            <ul>
                { this.state.matches.map(function(match) {
                  return <li onClick={ this.fillSearch }>{ match }</li>;
                }.bind(this)) }
            </ul>
          </div>
      );
    }
  });

  React.render(
    <AutoComplete />,
    document.getElementById('search')
  );

}(window.React));
