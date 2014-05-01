'use strict';

angular.module('yeomanAngularApp')
  .controller('ActorsAllCtrl', ['$scope', 'ActorsPaged', function ($scope, ActorsPaged) {
      $scope.actors = ActorsPaged.query({pageNumber: 1});
      
      $scope.onPaginate = function(pageNumber) {
          $scope.actors = ActorsPaged.query({pageSize: $scope.actors.pageSize, pageNumber: pageNumber});
      };
  }]);
