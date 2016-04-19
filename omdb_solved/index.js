var express = require('express');
var ejsLayouts = require('express-ejs-layouts');
var request = require('request');
var db = require('./models');
var bodyParser = require('body-parser');
var app = express();

app.set('view engine', 'ejs');
app.use(ejsLayouts);
app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static(__dirname + '/static'));

app.get('/', function(req, res) {
  res.render('index');
});

app.get('/movies', function(req, res) {
  var query = req.query.q;

  request('http://www.omdbapi.com/?s=' + query, function(err, response, body) {
    var data = JSON.parse(body);
    if (!err && response.statusCode === 200 && data.Search) {
      res.render('movies', {movies: data.Search, q: query});
    } else {
      res.render('error');
    }
  });
});

app.get('/movies/:imdbID', function(req, res) {
  var searchQuery = req.query.q ? req.query.q : '';
  var imdbID = req.params.imdbID;
  request('http://www.omdbapi.com/?i=' + imdbID, function(err, response, body) {
    res.render('movieShow', {movie: JSON.parse(body),
                             q: searchQuery});
  });
});

app.get('/favorites', function(req, res) {
  db.favorite.findAll().then(function(favorites) {
    res.render('favorites', {favorites: favorites});
  });
});

app.post('/favorites', function(req, res) {
  var newFavorite = req.body;

  db.favorite.create(newFavorite).then(function(favorite) {
    res.status(200).send('Created Favorite');
  });
});

app.get('/favorites/:imdbId/comments', function(req, res) {
  db.favorite.findOne({where: {imdbId: req.params.imdbId}}).then(function(favorite) {
    favorite.getComments().then(function(comments) {
      request('http://www.omdbapi.com/?i=' + req.params.imdbId, function(err, response, body) {
        res.render('comments', {movie: JSON.parse(body),
                                comments: comments});
      });
    });
  });
});

app.post('/favorites/:imdbId/comments', function(req, res) {
  var comment = req.body;
  console.log("comment:", comment);

  db.favorite.findOne({where: {imdbId: req.params.imdbId}}).then(function(favorite) {
    favorite.createComment(comment).then(function(comment) {
      //res.redirect('/favorites/' + req.imdbId + '/comments');
      res.redirect(req.url);
    });
  })
});

app.get('/favorites/:imdbId/tag', function(req, res) {
  res.render('tag', {imdbId: req.params.imdbId});
});

app.post('/favorites/:imdbId/tag', function(req, res) {
  var tag = req.body;
  console.log("tag:", tag);

  db.tag.findOrCreate({where: {name: tag.name}}).spread(function(tag, isCreated) {
    db.favorite.findOne({where: {imdbId: req.params.imdbId}}).then(function(favorite) {
      favorite.addTag(tag);
      res.send({fav: favorite, tag: tag});
    });
  });
});

var port = 3000;
app.listen(port, function() {
  console.log("You're listening to the smooth sounds of port " + port);
});
