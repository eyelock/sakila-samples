'use strict';

angular.module('yeomanAngularApp')
  .controller('ActorsDetailCtrl', ['$scope', '$routeParams', 'Actor', 'ActorFilmsPaged', function ($scope, $routeParams, Actor, ActorFilmsPaged) {
      $scope.actorId = $routeParams.actorId;
	  $scope.actor = Actor.get({actorId:$scope.actorId});
      $scope.films = ActorFilmsPaged.query({actorId:$scope.actorId, pageNumber:1});
      
      $scope.onPaginate = function(pageNumber) {
          $scope.films = ActorFilmsPaged.query({pageSize: $scope.films.pageSize, pageNumber: pageNumber});
      };
  }]);
