angular.module('StarWarsServices', ['ngResource'])

.factory('Films', ['$resource', function($resource) {
  return $resource('http://swapi.co/api/films/:id', {}, {
    query: {isArray: false}
  });
}]);