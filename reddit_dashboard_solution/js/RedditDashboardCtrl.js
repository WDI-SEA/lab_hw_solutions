app.controller('RedditDashboard',['$scope','$http','$modal',function($scope,$http,$modal){
    $scope.searchTerm="";
    $scope.searchResults=[];
    $scope.searchFeatured=[];
    $scope.loading=false;

    try{
        $scope.history=JSON.parse(window.localStorage.history) || [];
        $scope.historySelected=parseInt(window.localStorage.historySelected || -1);
    } catch(e) {
        $scope.history=[];
        $scope.historySelected=-1;
    }

    $scope.search = function(){
        var historyIndex = $scope.history.indexOf($scope.searchTerm);
        if(historyIndex == -1){
            $scope.history.push($scope.searchTerm);
            $scope.historySelected=$scope.history.length-1;
        }else{
            $scope.historySelected=historyIndex;
        }

        doSearch();

        $scope.searchTerm="";
    }

    $scope.searchClear = function(){
        $scope.searchTerm="";
        $scope.historySelected=-1;
        $scope.searchResults=[];
        $scope.searchFeatured=[];
    }

    $scope.historySelect = function(idx){
        $scope.searchTerm=$scope.history[idx];
        $scope.historySelected=idx;
        doSearch();
    }

    $scope.historyDelete=function(idx){
        $scope.history.splice(idx,1);
        if($scope.historySelected==idx){
            $scope.searchClear();
        }
    }

    $scope.showComments = function(idx){
        var modalInstance = $modal.open({
          templateUrl: 'redditCommentModal.html',
          controller: 'CommentsModalCtrl',
          size: 'md',
          resolve: {
            item: function () {
              return $scope.searchResults[idx];
            }
          }
        });
    }

    //$scope.history = []
    $scope.$watchCollection('history',function(newVal,oldVal){
        console.log('triggered history');
        window.localStorage.history=JSON.stringify($scope.history);
    });

    //$scope.historySelected = 4
    $scope.$watch('historySelected',function(newVal,oldVal){
        console.log('triggered historySelected');
        window.localStorage.historySelected=$scope.historySelected;
    });


    var doSearch = function(){
        $scope.loading=true;
        $scope.searchResults=[];
        $scope.searchFeatured=[];
        var req = {
          url: "http://www.reddit.com/search.json",
          params: {
            q: $scope.searchTerm
          }
        };
        $http(req).success(function(data){
            $scope.loading=false;
            $scope.searchFeatured=[];

            if(data && data.data && data.data.children){
                $scope.searchResults=data.data.children;
                for(var i = 0; i < data.data.children.length; i++){
                    if(data.data.children[i].data.thumbnail.length > 5){
                        $scope.searchFeatured.push(data.data.children[i]);
                    }
                    if($scope.searchFeatured.length >= 4) break;
                }


                console.log(data.data.children);
            }else{
                $scope.searchResults=[];
            }

        });
    }

    if($scope.historySelected > -1){
        $scope.historySelect($scope.historySelected);
    }

}]);
