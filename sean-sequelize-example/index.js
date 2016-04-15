var express = require('express');
var bodyParser = require('body-parser');
var db = require('./models');
var app = express();

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: false}));
app.use(express.static(__dirname + '/static'));

app.get('/', function(req, res) {
  db.user.findAll().then(function(users) {
    res.render('index', {users: users});
  });
});

// Create user route
app.post('/', function(req, res) {

  var newUser = {
    firstName: req.body.firstName,
    lastName: req.body.lastName,
    age: req.body.age,
    email: req.body.email
  }

  db.user.create(newUser).then(function() {
    res.redirect('/');
  });
});

// Delete user route
app.delete('/', function(req, res) {
  var userId = req.body.id;

  db.user.destroy({where: {id: userId}}).then(function() {
    res.status(200).send('Deleted User');
  });
});


// Edit User routes
app.get('/edituser/:id', function(req, res) {
  var userId = req.params.id;

  db.user.findOne({where: {id: userId}}).then(function(user) {
    res.render('edituser', {user: user});
  });
});

app.get('/edituser', function(req, res) {

  var userId = req.query.id;

  var updatedUser = {
    firstName: req.query.firstName,
    lastName: req.query.lastName,
    age: req.query.age,
    email: req.query.email
  }

  db.user.update(updatedUser, {where: {id: userId}}).then(function() {
    res.redirect('/');
  });

});

app.listen(3000);