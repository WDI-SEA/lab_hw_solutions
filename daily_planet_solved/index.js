var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static(__dirname + '/static'));

var articles = [
  {title: 'Bernie! Bernie!', body: '#feelthebern'},
  {title: 'Trump for change!', body: 'Make America Great Again'},
  {title: 'Brian Hague founds the Daily Planet', body: 'Wow! Amazing! Such good news!'}
];

debugger

app.get('/', function(req, res) {
  res.render('index.ejs');
});

app.get('/articles', function(req, res) {
  // search term
  var searchTerm = req.query.q;

  // moved logic for the filtering to the .ejs file. Uncomment at your own risk

  // var filteredArticles = [];
  // if (searchTerm) {
  //   searchTerm = searchTerm.toLowerCase();
  //   filteredArticles = articles.filter(function(article) {
  //     if (article.title.toLowerCase().indexOf(searchTerm) > -1 || article.body.toLowerCase().indexOf(searchTerm) > -1) {
  //       return true;
  //     }
  //     return false;
  //   });
  // } else {
  //   filteredArticles = articles;
  // }

  // res.send(req.query);
  res.render('articles/index.ejs', {articles: articles,
                                    searchTerm: searchTerm});
});

app.get('/articles/new', function(req, res) {
  res.render('articles/new.ejs');
});

app.get('/articles/:idx', function(req, res) {
  var idx = parseInt(req.params.idx);
  if (idx < articles.length && idx >= 0) {
    res.render('articles/show.ejs', {article: articles[idx], index: idx});
  } else {
    res.send('Error');
  }
});

app.delete('/articles', function(req, res) {
  var index = parseInt(req.body.index);

  debugger

  articles.splice(index, 1);

  res.status(200).send('Deleted Successfully!');
});

app.post('/articles', function(req, res) {
  articles.push(req.body);
  res.redirect('/articles');
});

app.get('/about', function(req, res) {
  res.render('about.ejs');
});

app.listen(3000, function() {
  console.log("You're listening to the smooth sounds of port 3000 in the morning");
});

