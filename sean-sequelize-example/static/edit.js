$('.edit-button').click(function(e) {
  window.location = '/edituser/' + $(this).parent().attr('id');
});

$('#update-form').submit(function(e) {

  e.preventDefault();

  console.log(typeof($(this)));

  var myUrl = $(this).attr('action');
  var myData = $(this).serialize();

  console.log(myUrl);

  $.ajax({
    method: 'GET',
    url: '/edituser',
    data: myData,
    success: function() {
      window.location = '/'
    },
    error: function(err) {
      console.log(err);
    }
  });
});