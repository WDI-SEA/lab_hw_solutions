var imageLinks = [];
var counter = 0;
var slideInterval;
var errorCount = 0;
var currentImage;

$('#slideshow-image').load(function() {
  //console.log('image loaded!');
}).error(function(err) {
  errorCount++;
  var url = err.target.currentSrc;

  if(url.includes('.jpg.png') || url.includes('.gif.png')) {
    url = url.slice(0, url.length - 4);
    //console.log(url);
    $('#slideshow-image').attr('src', url);
  } else if (errorCount > 1) {
    console.log(currentImage);
    url = currentImage.fallBackImage;
    errorCount = 0;
  } else {
    url = url.slice(0, url.length - 4);
    url = url + '.jpg';
    $('#slideshow-image').attr('src', url);
  }
});

$('#search-form').submit(function(event) {
  event.preventDefault();

  var query = $('#search-input').val();

  if(!query || typeof(query) != 'string') {
    alert("Please enter a valid search")
    return;
  }

  $.get('https://www.reddit.com/r/pics/search.json', {
    q: query,
    nsfw: 'no',
    restrict_sr: 'on'
  }).done(function(response) {
    console.log(response);

    var results = response.data.children;

    for(var i = 0; i < results.length; i++) {
      var newImage = {};
      var imageCollection;

      if(!results[i].data.url) {
        if(!results[i].data.preview) {
          newImage.imageLink = results[i].data.thumbnail;
        } else {
          imageCollection = results[i].data.preview.images[0].resolutions;
          newImage.imageLink = imageCollection[imageCollection.length - 1].url;
        }
      } else {
        newImage.imageLink = results[i].data.url + '.png';
      }

      // var newImage = {
      //   imageLink: imageLink
      // }
      console.log(imageCollection);
      if(imageCollection) {
        console.log('There is an image collection');
        newImage.fallBackImage = imageCollection[imageCollection.length - 1].url
      } else {
        newImage.fallBackImage = '';
      }

      imageLinks.push(newImage);
    }

    $('#slideshow-image').attr('src', imageLinks[counter]);
    currentImage = imageLinks[counter];

    var slideInterval = setInterval(function() {
      counter++;
      currentImage = imageLinks[counter];
      if(counter === imageLinks.length) {
        counter = 0;
      }
      $('#slideshow-image').attr('src', imageLinks[counter].imageLink);
    }, 2000);
  });
});