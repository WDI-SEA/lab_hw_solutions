angular.module('StarWarsCtrls', ['StarWarsServices'])

.controller('FilmsCtrl', ['$scope', '$state', 'Films', function($scope, $state, Films) {
  $scope.films = [];

  $scope.goToAbout = function() {
    $state.go('about');
  }

  $scope.showMovie = function(movieId) {
    $state.go('showFilm', {id: movieId});
  }

  Films.query(function success(data) {
    $scope.films = data.results;
  }, function error(data) {
    console.log(data);
  });
}])

.controller('FilmShowCtrl', ['$scope', '$stateParams', 'Films', function($scope, $stateParams, Films) {
  $scope.film = {};

  Films.get({id: $stateParams.id}, function success(data) {
    console.log(data);
    $scope.film = data;
  }, function error(data) {
    console.log(data);
  })
}])