var express = require('express');
var bodyParser = require('body-parser');
var app = express();

var animals = [
  {name: 'Sean', type: 'dolphin'},
  {name: 'Steve', type: 'jaguar'},
  {name: 'Erin', type: 'turtle'},
  {name: 'Gus', type: 'ASS'},
  {name: 'Nat', type: 'owl'}
];

app.use(express.static(__dirname + '/views'));
app.set('view engine', 'ejs');
app.use( bodyParser.urlencoded({extended: false}) );

app.get('/', function(req, res) {
  res.render('index', {name: 'Bill Billerson III esq.', things: ['stuff', 'junk', 'sean']});
});

app.post('/animals', function(req, res) {
  animals.push(req.body);

  res.redirect('/animals');
});

app.get('/animals', function(req, res) {
  res.render('animals/index', {myAnimals: animals});
});

app.get('/animals/:index', function(req, res) {
  var animalIndex = parseInt(req.params.index);

  res.render('animals/show', {myAnimal: animals[animalIndex]});
});

app.listen(3000);

















