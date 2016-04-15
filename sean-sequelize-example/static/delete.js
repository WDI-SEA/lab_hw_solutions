$('.delete-button').click(function(e) {
  deleteUser($(this).parent().attr('id'));
});

function deleteUser(userId) {
  $.ajax({
    url: '/',
    type: 'DELETE',
    data: {id: userId},
    success: function() {
      window.location = '/';
    },
    error: function(err) {
      console.log('Error Deleting: ', err);
    }
  });
}