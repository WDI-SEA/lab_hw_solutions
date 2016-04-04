if(localStorage.getItem('todos')) {
  var todos = JSON.parse(localStorage.getItem('todos'));
  for(var i = 0; i < todos.length; i++) {
    $('#container').append('<p>' + todos[i] + '</p>');
  }
} else {
  $.getJSON('data.json', function(data) {
    for(var i = 0; i < data.todos.length; i++) {
      $('#container').append('<p>' + data.todos[i].text + '</p>');
    }
  });
}

var todoArray = [];

$('#todo-form').submit(function(event) {
  event.preventDefault();

  var todo = $('#todo-input').val();
  $('#container').append('<p>' + todo + '</p>');
  $('#todo-input').val('');

  todoArray.push(todo);
  localStorage.setItem('todos', JSON.stringify(todoArray));
});