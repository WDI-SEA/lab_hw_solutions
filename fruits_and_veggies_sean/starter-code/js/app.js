var fruitApp = angular.module('fruitVegApp', []);

fruitApp.controller('fruitVegController', ['$scope', '$timeout', function($scope, $timeout) {
  $scope.mixed = fruit.concat(vegetables).sort(function() { return 0.5 - Math.random() });
  $scope.fruits = [];
  $scope.veggies = [];
  $scope.incorrectItems = document.querySelectorAll('.incorrect').length;
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

    // Using timeout to allow DOM to render
    // before reseting $scope variable.
    // $timeout calls $digest as well.
    $timeout(function() {
      $scope.incorrectItems = document.querySelectorAll('.incorrect').length;
    }, 0);
  }

  $scope.checkItem = function(name, columnName) {
    if($scope.originals[columnName].indexOf(name) === -1) {
      return false;
    } else {
      return true;
    }
  }

  $scope.checkForWin = function() {
    if($scope.incorrectItems) {
      $scope.hasWon = false;
      $scope.message = 'Something is wrong!';
    } else {
      $scope.hasWon = true;
      $scope.message = 'You Did It!!'
    }   
  }
}]);