/* global React */

  var TodoList = React.createClass({
    getInitialState: function() {
      return { todoList: window.TodoStore.all()};
    },

    componentDidMount: function() {
      window.TodoStore.addChangeHandler(this.todosChanged);
      window.TodoStore.fetch();
    },

    componentWillUnmount: function() {
    window.TodoStore.removeChangeHandler(this.todosChanged);
    },

    render: function() {
      return (
        <div>
          I AM THE LIST
          {
            this.state.todoList.map (function (todo){
              return (
                <li>{todo.title}</li>
              );
            })
          }
        </div>
      );
    },

    todosChanged: function() {
      this.setState({todoList: window.TodoStore.all()});
    },

  });
