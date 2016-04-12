$('.delete-button').click(function(e) {
  e.preventDefault();

  var index = $(this).attr('id');

  if (confirm('Are you sure you want to delete the article?')) {
    $.ajax({
      url: '/articles',
      method: 'DELETE',
      data: {index: index},
      success: function(data, status, obj) {
        alert('Deleted Article');
        window.location = '/articles';
      },
      error: function(err, status, message) {
        console.log(err, status, message);
      }
    });
  } else {

    return;
  
  }
});