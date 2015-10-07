(function(root) {
  'use strict';

  var _todos = [], _callbacks = [];

  root.TodoStore = {
    changed: function() {
      _callbacks.forEach(function(callback){callback(); });
    },

    addChangeHandler: function (callback) {
      _callbacks.push(callback);
    },

    removeChangeHandler: function (callback) {
      var idx = _callbacks.indexOf(callback);
      _callbacks.splice(idx, 1);
    },

    all: function () {
      return _todos.slice();
    },

    fetch: function () {
      $.ajax ({
        url: 'api/todos',
        dataType: 'json',
        success: function (response) {
          _todos = response;
          root.TodoStore.changed();
        }
      });
    },

    create: function (todo) {
      var that = this;
      $.ajax ({
        url: 'api/todos', // is this route correct
        method: 'post',
        data: {todo: todo},
        success: function (response) {
          _todos.push(response), // how does this contain an id
        that.changed();

        }
      });
    },

    delete: function (id) {
      var foundId = root.TodoStore.findById(id);
      var that = this;
      if (foundId) {
        $.ajax ({
          url: 'api/todos/'+foundId,
          method: 'DELETE',
          success: function (response) {
            _todos.splice(foundId, 1), // how does this contain an id
            that.changed();
          }
        });
      }
    },

    toggleDone: function (id) {
      var foundTodo = root.TodoStore.findById(id);
      foundTodo.done = !foundTodo.done;
      var that = this;
      if (foundTodo) {
        $.ajax ({
          url: 'api/todos/'+id,
          method: 'PATCH',
          data: {todo: foundTodo },
          success: function (response) {
            that.changed();
          }
        });
      }
    },

    findById: function (id) {
      for (var i = 0; i < _todos.length; i++) {
        if (_todos[i].id === id) {
          return _todos[i];
        }
      }
  }
};

})(this);
