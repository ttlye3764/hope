/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: Todo component
 */

// Todo
class Todo {
  constructor() {
    this.body = $('body');
    this.todoContainer = $('#todo-container');
    this.todoMessage = $('#todo-message');
    this.todoRemaining = $('#todo-remaining');
    this.todoTotal = $('#todo-total');
    this.archiveBtn = $('#btn-archive');
    this.todoList = $('#todo-list');
    this.todoDonechk = '.todo-done';
    this.todoForm = $('#todo-form');
    this.todoInput = $('#todo-input-text');
    this.todoBtn = $('#todo-btn-submit');

    this.todoCompletedData = [];
    this.todoUnCompletedData = [];

    this.dummyTodos();
  }

  /**
   * Adds dummy todo data
   */
  dummyTodos() {
    this.todoData = [
      {
        id: '1',
        text: 'Design One page theme',
        done: false,
      },
      {
        id: '2',
        text: 'Build a js based app',
        done: true,
      },
      {
        id: '3',
        text: 'Creating component page',
        done: true,
      },
      {
        id: '4',
        text: 'Testing??',
        done: true,
      },
      {
        id: '5',
        text: 'Hehe!! This looks cool!',
        done: false,
      },
      {
        id: '6',
        text: 'Create new version 3.0',
        done: false,
      },
      {
        id: '7',
        text: 'Build an angular app',
        done: true,
      },
    ];
  }

  /**
   * Mark the todo matching with given todo completed
   * @param {*} todoId
   * @param {*} completed
   */
  markTodo(todoId, completed) {
    for (var count = 0; count < this.todoData.length; count++) {
      if (this.todoData[count].id == todoId) {
        this.todoData[count].done = completed;
      }
    }
  }

  /**
   * Adds new todo
   * @param {*} todoText
   */
  addTodo(todoText) {
    this.todoData.push({
      id: this.todoData.length,
      text: todoText,
      done: false,
    });
    //regenerate list
    this.renderTodoList();
  }

  /**
   * Archives the completed todos
   */
  archives() {
    this.todoUnCompletedData = [];
    for (var count = 0; count < this.todoData.length; count++) {
      //geretaing html
      var todoItem = this.todoData[count];
      if (todoItem.done == true) {
        this.todoCompletedData.push(todoItem);
      } else {
        this.todoUnCompletedData.push(todoItem);
      }
    }
    this.todoData = [];
    this.todoData = [].concat(this.todoUnCompletedData);
    //regenerate todo list
    this.renderTodoList();
  }

  /**
   * Render the todo list
   */
  renderTodoList() {
    this.todoList.html('');
    var remaining = 0;
    for (var count = 0; count < this.todoData.length; count++) {
      //geretaing html
      var todoItem = this.todoData[count];
      if (todoItem.done == true) {
        this.todoList.prepend(
          '<li class="list-group-item border-0 pl-0"><div class="custom-control custom-checkbox"><input type="checkbox" class="custom-control-input todo-done" id="' +
            todoItem.id +
            '" checked><label class="custom-control-label" for="' +
            todoItem.id +
            '"><s>' +
            todoItem.text +
            '</s></label></div></li>'
        );
      } else {
        remaining = remaining + 1;
        this.todoList.prepend(
          '<li class="list-group-item border-0 pl-0"><div class="custom-control custom-checkbox"><input type="checkbox" class="custom-control-input todo-done" id="' +
            todoItem.id +
            '"><label class="custom-control-label" for="' +
            todoItem.id +
            '">' +
            todoItem.text +
            '</label></div></li>'
        );
      }
    }

    //set total in ui
    this.todoTotal.text(this.todoData.length);
    //set remaining
    this.todoRemaining.text(remaining);
  }

  /**
   * Initlizes the todo list
   */
  init() {
    var self = this;
    //generating todo list
    this.renderTodoList();

    //binding archive
    this.archiveBtn.on('click', function(e) {
      e.preventDefault();
      self.archives();
      return false;
    });

    //binding todo done chk
    $(document).on('change', this.todoDonechk, function() {
      if (this.checked) self.markTodo($(this).attr('id'), true);
      else self.markTodo($(this).attr('id'), false);
      //regenerate list
      self.renderTodoList();
    });

    //binding the new todo button
    this.todoForm.on('submit', function(e) {
      e.preventDefault();
      if (
        self.todoInput.val() == '' ||
        typeof self.todoInput.val() == 'undefined' ||
        self.todoInput.val() == null
      ) {
        self.todoInput.focus();
        return false;
      } else {
        self.addTodo(self.todoInput.val());
        return true;
      }
    });
  }
}

export default Todo;
