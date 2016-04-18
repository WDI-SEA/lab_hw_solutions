var express = require('express');
var bodyParser = require('body-parser');
var ejsLayouts = require('express-ejs-layouts');
var db = require('./models');
var app = express();

app.set('view engine', 'ejs');
app.use(ejsLayouts);
app.use(express.static(__dirname + '/static'));
app.use(bodyParser.urlencoded({extended: false}));

app.get('/', function(req, res) {
  res.render('home');
});

app.get('/posts', function(req, res) {
  db.post.findAll().then(function(posts) {
    res.render('posts/posts', {posts: posts});
  });
});

app.get('/post/:id', function(req, res) {
  var postId = req.params.id;

  db.post.find({where: {id: postId}}).then(function(post) {
    db.author.find({where: {id: post.authorId}}).then(function(author) {
      res.render('posts/post_show', {post: post, author: author});
    });
  });
});

app.get('/create_post', function(req, res) {
  db.author.findAll().then(function(authors) {
    res.render('posts/create_post', {authors: authors});
  });
});

app.post('/create_post', function(req, res) {
  var newPost = req.body;

  db.post.create(newPost).then(function() {
    res.redirect('/posts');
  });
});

app.get('/authors', function(req, res) {
  db.author.findAll().then(function(authors) {
    res.render('authors/authors', {authors: authors});
  });
});

app.get('/author/:id', function(req, res) {
  var authorId = req.params.id;

  db.author.find({where: {id: authorId}, include: [db.post]}).then(function(author) {
    res.render('authors/author_show', {author: author});
  });
});

app.get('/create_author', function(req, res) {
  res.render('authors/create_author');
});

app.post('/create_author', function(req, res) {
  var newAuthor = req.body;

  db.author.create(newAuthor).then(function() {
    res.redirect('/authors');
  });
});

app.listen(3000, function() {
  console.log('Relationships app running');
});