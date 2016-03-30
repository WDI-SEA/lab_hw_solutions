// Start by wrapping our code in document ready function
// so the code runs after the HTML and CSS load

var todos = JSON.parse(localStorage.getItem('todos')) || [];

$(document).ready(function() {

  for(var i = 0; i < todos.length; i++) {
    createToDo(todos[i]);
  }

  $('#todo-list').sortable();

  // ----------------------- Event Listeners -------------------------------

  // Our event listener for submitting the form and creating a todo
  $('#add-todo').submit(function(e) {
    e.preventDefault();

    // First we'll grab the value of the todo input field
    var todoText = $('#todo-input').val();

    if (!todoText) {
      alert('Please enter text to add a ToDo');
      return;
    } else {
      todos.push(todoText);
      localStorage.setItem('todos', JSON.stringify(todos));
      // Then we'll pass that text into our 'createToDo' function
      createToDo(todoText);
    }
  });

  // Our event listener that listens to click events on all 'delete-button'
  // elements inside our 'todo-list'
  $('#todo-list').on('click', '.delete-button', deleteTodo);
});

// Our function for creating a ToDo entry
var createToDo = function(text) {

  // We can define our new HTML using just a string, there are other methods as well
  var html = '<li><p class="todo-item">' + text + '</p><button type="button" class="delete-button">X</button></li>';

  // Using JQuery we call the 'append' function that adds our new HTML to the 'todo-list' ul element
  $('#todo-list').append(html);

  // Wipe out the current text in the input field
  $('#todo-input').val('');

}

// Our function for deleting specific todo's
var deleteTodo = function(e) {
  e.preventDefault();

  console.log(this);

  var todoIndex = todos.indexOf($(this).prev().text());
  todos.splice(todoIndex, 1);
  localStorage.setItem('todos', JSON.stringify(todos));

  // Using JQuery we're going to grab the current element that was clicked (this)
  // then remove the parent of the button using 'parent()' chained with 'remove()'
  $(this).parent().remove();
  //var todoIndex = todos.indexOf(this);
}

















