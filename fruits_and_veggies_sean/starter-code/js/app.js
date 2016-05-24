/* setup your angular app here */

var fruitApp = angular.module('fruitVegApp', []);

fruitApp.controller('fruitVegController', ['$scope', function($scope) {
  $scope.mixed = fruit.concat(vegetables).sort(function() { return 0.5 - Math.random() });
  $scope.fruits = [];
  $scope.veggies = [];
  $scope.originals = {
    veggies: vegetables,
    fruits: fruit
  }

  $scope.move = function(name, originCol, destCol) {
    $scope[originCol].splice($scope[originCol].indexOf(name), 1);
    $scope[destCol].push(name);
    if($scope.mixed.length === 0) {
      $scope.checkForWin();
    }
  }

  $scope.checkItem = function(name, columnName) {

    if($scope.originals[columnName].indexOf(name) === -1) {
      return false;
    } else {
      return true;
    }
  }

  $scope.checkForWin = function() {
    var badItems = document.querySelectorAll('.incorrect').length;
    if(badItems) {
      $scope.hasWon = false;
      $scope.message = 'Something is wrong!';
    } else {
      $scope.hasWon = true;
      $scope.message = 'You Did It!!'
    }   
  }
}]);