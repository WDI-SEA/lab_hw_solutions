var express = require('express');
var bodyParser = require('body-parser');
var HashIds = require('hashids');
var ejsLayouts = require('express-ejs-layouts');
var hashids = new HashIds("This is a salt and I like it", 6, 'usUSncNC0123456789');
var db = require('./models');
var app = express();

app.set('view engine', 'ejs');
app.use(ejsLayouts);
app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static(__dirname + '/static'));

app.get('/', function(req, res) {
  res.render('index');
});

app.post('/link', function(req, res) {
  var newLink = {
    url: req.body.url
  }

  db.link.findOrCreate({where: {url: newLink.url}}).spread(function(link, created) {
    res.redirect('/link/' + link.id);
  });
});

app.get('/link/:hash', function(req, res) {
  res.render('showLink', {hash: req.params.hash});
});

app.get('/:hash', function(req, res) {
  console.log(req.params.hash);
  db.link.find({where: {id: req.params.hash}}).then(function(link) {
    res.redirect(link.url);
  });
});

app.listen(3000, function() {
  console.log('Hello Dave...');
});