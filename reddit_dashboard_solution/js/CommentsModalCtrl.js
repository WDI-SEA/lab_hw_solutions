app.controller('CommentsModalCtrl', ['$scope','$modalInstance','$http','item',function ($scope, $modalInstance, $http, item) {
    $scope.comments=[];

    var req = {
      url: 'http://www.reddit.com'+item.data.permalink.replace(/\/\?/,'.json?')
    };
    $http(req).success(function(data){
        console.log(data);
        $scope.comments=data[1].data.children
    });

  $scope.ok = function () {
    $modalInstance.close();
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
}]);