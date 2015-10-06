(function (React) {

  var MinesweeperGame = React.createClass ({
    getInitialState: function () {
      return {
        board: new window.Minesweeper.Board(20, 20),
        over: false,
        won: false
      };
    },

    updateGame: function (pos, revealed) {
      debugger;
      var tile = this.state.board.grid[pos[0]][pos[1]];
      if (revealed) {
        tile.explore();
      } else {
        tile.toggleFlag();
      }
      if (this.state.board.won) {
        console.log("yeahhhhh");
        this.setState({won: true, over: true});
      } else if (this.state.board.lost) {
        console.log("nooooooo");
        this.setState({won: false, over: true});
      }

    },

    render: function () {
      return (
        <Board board={this.state.board} update={this.updateGame}/>
      );
    }
  });

  var Board = React.createClass({
    render: function () {
      return(
        <div className="board">
          {
            this.props.board.grid.map(function(row, rowIdx) {
              return(
                  <div> {
                    row.map(function(tile, colIdx) {
                      return(
                        <Tile tileObj={ tile }
                                  pos={ [rowIdx, colIdx] }
                               update={ this.props.update }/>
                      );
                    }.bind(this))
                  } </div>
                );
            }.bind(this))
          }
        </div>
      );
    }
  });

  var Tile = React.createClass({
    getInitialState: function () {
      var klass;
      var displayText;

      if (this.props.tileObj.flagged) {
        klass = "flagged";
        displayText = "⚑";
      } else if (this.props.tileObj.bombed && this.props.tileObj.explored) {
        klass = "bombed";
        displayText = "💣";
      } else if (this.props.tileObj.explored) {
        var bombCount = this.props.tileObj.adjacentBombCount;
        klass = bombCount > 0 ? "number" : "empty";
        displayText = bombCount > 0 ? bombCount : "";
      } else {
        klass = "unexplored";
        displayText = "";
      }
      return (
        {
          klass: klass,
          position: this.props.pos,
          displayText: displayText
        }
      );
    },

    handleClick: function (e) {
      var clicked = e.currentTarget;
      debugger;
      this.props.update(this.state.position, !e.altKey);
    },

    render: function () {
      var classString = "tile " + this.state.klass;
      return <div className={classString}
                  onClick={this.handleClick}>{this.state.displayText}</div>;
    }
  });

  React.render(
    <MinesweeperGame />,
    document.getElementById('game')
  );

})(window.React);
