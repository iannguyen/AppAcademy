/* global React, TONES, Note, KeyStore */

(function(root) {
  'use strict';
  root.Components = {};

  var keyNotes = {
    "97": "C",
    "115": "D",
    "100": "E",
    "102": "F",
    "103": "G",
    "104": "A",
    "106": "B",
    "107": "C"
  };

  root.Components.Key = React.createClass({
    getInitialState: function () {
      return { playing: false };
    },
    componentDidMount: function () {
      this.note = new Note(TONES[this.props.noteName]);
      KeyStore.addChangeHandler(this.handleChange);
    },
    handleChange: function(){
      if(KeyStore.all().indexOf(this.props.noteName) !== -1){
        this.note.start();
        this.setState( {playing: true} );
      }
      else{
        this.note.stop();
        this.setState( {playing: false} );
      }
    },
    render: function(){
        if(this.state.playing)
        {
          return(
            <div><b>{this.props.noteName}</b></div>
          );
        }
        else{
          return(
            <div>{this.props.noteName}</div>
          );
        }
    }
  });

  root.Components.Organ = React.createClass({
    render: function () {
      return (
          <div>
            <ul>
            {
              Object.keys(root.TONES).map(function (note, idx) {
                return <li className="key">
                  <Components.Key key={idx} noteName={note}/>{keyNotes[note]}
                  </li>;
              })
            }
            </ul>
            <Components.Recorder />
          </div>
      );
    }
  });
}(this));
