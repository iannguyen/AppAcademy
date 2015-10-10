/* global React */

(function(root) {
  'use strict';

  root.Components.Recorder = React.createClass({
    getInitialState: function(){
      return {isRecording: false, track: new root.Track({name: "track"})};
    },
    componentDidMount: function(){
      KeyStore.addChangeHandler(this.handleChange);
    },
    handleChange: function(){
      if(this.state.isRecording){
        this.state.track.addNotes(KeyStore.all());
      }
    },
    handleStartButton: function(){
      this.state.track.startRecording();
      this.setState({isRecording: true});
    },
    handleStopButton: function(){
      this.state.track.stopRecording();
      this.setState({isRecording: false});
    },
    handlePlayButton: function(){
      this.state.track.play();
    },
    render: function(){
      return(
        <div>
          <button onClick={this.handleStartButton}>Start Recording</button>
          <button onClick={this.handleStopButton}>Stop Recording</button>
          <button onClick={this.handlePlayButton}>Play Recording</button>
        </div>
      );
    }
  });
}(this));
