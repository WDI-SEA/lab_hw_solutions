$('#favorite-btn').click(function(e) {

  var newFavorite = {
    title: $('h1').text(),
    year: $('h3').text(),
    imdbId: $(this).attr('data-imdbId')
  }

  $.ajax({
    url: '/favorites',
    method: 'POST',
    data: newFavorite,
    success: function() {
      window.location = '/favorites';
    }
  })
});