(function (React) {
  var TABS = [{Home: "homecontent"},
              {About: "aboutcontent"},
              {Contact: "contactcontent"}];

  var Tabs = React.createClass ({
    getInitialState: function () {
      return { selected: 0 };
    },

    handleClick: function (e) {
      var clicked = e.currentTarget.innerText;
      var selected;
      TABS.forEach(function(obj, idx) {
        if (clicked === Object.keys(obj)[0]) {
          selected = idx;
        }
      });
      this.setState({selected: selected});
    },

    render: function () {
      return(
        <div>
          <ul>
            {TABS.map(function(tab, idx){
              return <li className={idx === this.state.selected ? "selected" : ""}
                         onClick={this.handleClick}>
                       {Object.keys(tab)[0]}
                     </li>;
            }.bind(this))}
          </ul>
          <article>
            {TABS[this.state.selected]}
          </article>
        </div>
      );
    }
  });

  React.render(<Tabs/>, document.getElementById("tabs"));
})(window.React);
