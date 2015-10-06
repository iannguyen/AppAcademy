(function (React) {

  var ClockWidget = React.createClass ({
    getInitialState: function() {
      return { currentTime: new Date() };
    },
    componentDidMount: function() {
      setInterval(this._tick, 1000);
    },
    _tick: function() {
      var seconds = this.state.currentTime.getTime() + 1000;
      this.setState({ currentTime: new Date(seconds) });
    },
    render: function() {
      return <h1>{ this.state.currentTime.toString() }</h1>;
    }
  });

  var WeatherWidget = React.createClass ({
    getInitialState: function () {
      return { weather: {} };
    },

    componentDidMount: function () {
      navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude;
        var lon = position.coords.longitude;
        setInterval(this.getWeather(lat, lon), 3600000);
      }.bind(this));
    },

    getWeather: function(lat, lon) {
      var requestUrl = "http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon;
      var xhr = new XMLHttpRequest();
      xhr.open('get',requestUrl);
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
          var weatherResponse = JSON.parse(xhr.responseText);
          var weather = {};
          weather['Temperature'] = Math.floor(weatherResponse.main.temp * 9/5 - 459.67);
          weather['Wind'] = weatherResponse.wind.speed;
          weather['Description'] = weatherResponse.weather[0].description;
          weather['City'] = weatherResponse.name;
          this.setState({weather: weather});
        }
      }.bind(this);
      xhr.send();
    },

    render: function() {
      return(
        <ul>
          <li>City: {this.state.weather["City"]}</li>
          <li>Temperature: {this.state.weather["Temperature"]} F</li>
          <li>Wind Speed: {this.state.weather["Wind"]} M/S</li>
          <li>Description: {this.state.weather["Description"]}</li>
       </ul>
    );}
  });

  React.render(<ClockWidget/>, document.getElementById("clock"));
  React.render(<WeatherWidget/>, document.getElementById("weather"));
})(window.React);
