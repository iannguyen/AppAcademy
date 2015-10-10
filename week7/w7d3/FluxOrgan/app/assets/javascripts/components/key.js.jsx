/* global React, TONES, Note, KeyStore */

(function(root) {
  'use strict';
  root.Components = {};

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
            {
              Object.keys(root.TONES).map(function (note, idx) {
                return <Components.Key key={idx} noteName={note}/>;
              })
            }
            <Components.Recorder />
          </div>
      );
    }
  });
}(this));
