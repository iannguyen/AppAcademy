(function(root) {
  'use strict';

  var Track = root.Track = function (attr) {
    this.name = attr['name'];
    this.roll = attr['roll'] || [];
  };

  Track.prototype.startRecording = function () {
    this.roll = [];
    this.start = Date.now();
  };

  Track.prototype.addNotes = function (currentKeys) {
    var elapsedTime = Date.now() - this.start ;
    this.roll.push({timeSlice: elapsedTime, notes: currentKeys});
  };

  Track.prototype.stopRecording = function(){
    this.addNotes([]);
  };

  Track.prototype.play = function(){
    if(this.interval !== undefined)
    {
      return;
    }
    var playbackStartTime = Date.now();
    var currentNote = 0;

    this.interval = setInterval(function(){

      if(currentNote < this.roll.length){
        if((Date.now() - playbackStartTime) > this.roll[currentNote].timeSlice){
          KeyActions.keyReset(this.roll[currentNote].notes);
          currentNote++;
        }
      }
      else{
        clearInterval(this.interval);
        this.interval = undefined;
      }
    }.bind(this), 100);
  };

}(this));
